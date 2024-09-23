@implementation PKTiledCanvasView

uint64_t __98__PKTiledCanvasView_prewarmFutureCanvasesIfNecessarySecureRendering_prewarmSharedResourceHandler___block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  return objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing");
}

void __34__PKTiledCanvasView_setupDefaults__block_invoke()
{
  void *v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2[0] = CFSTR("internalSettings.drawing.apt.minimumMovementDistancePencil");
  v2[1] = CFSTR("internalSettings.drawing.apt.minimumMovementDistanceFinger");
  v3[0] = &unk_1E77ECEF8;
  v3[1] = &unk_1E77EB8E0;
  v2[2] = CFSTR("internalSettings.drawing.apt.minimumMovementDistanceTimeout");
  v3[2] = &unk_1E77ECF08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

- (PKStrokeGenerator)strokeGenerator
{
  uint64_t v3;
  void *v4;
  void *v5;
  PKStrokeGenerator *v6;
  PKStrokeGenerator *fallbackStrokeGenerator;
  PKStrokeGenerator *v8;
  PKStrokeGenerator *v9;
  void *v10;

  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 528);
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    fallbackStrokeGenerator = self->_fallbackStrokeGenerator;
    if (!fallbackStrokeGenerator)
    {
      v8 = objc_alloc_init(PKStrokeGenerator);
      v9 = self->_fallbackStrokeGenerator;
      self->_fallbackStrokeGenerator = v8;

      fallbackStrokeGenerator = self->_fallbackStrokeGenerator;
    }
    v6 = fallbackStrokeGenerator;
  }
  -[PKStrokeGenerator delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[PKStrokeGenerator setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (BOOL)sixChannelBlending
{
  return self->_sixChannelBlending;
}

- (void)setupGestures
{
  PKDrawingGestureRecognizer *v3;

  v3 = objc_alloc_init(PKDrawingGestureRecognizer);
  -[PKDrawingGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[PKDrawingGestureRecognizer setDrawingTarget:](v3, "setDrawingTarget:", self);
  -[PKTiledCanvasView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  -[PKTiledCanvasView setDrawingGestureRecognizer:](self, "setDrawingGestureRecognizer:", v3);
  -[PKTiledCanvasView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1);

}

- (void)setupDrawing
{
  void *v3;
  PKDrawing *v4;
  PKDrawing *drawing;

  v3 = (void *)objc_opt_new();
  -[PKTiledCanvasView setInk:](self, "setInk:", v3);

  v4 = objc_alloc_init(PKDrawing);
  drawing = self->_drawing;
  self->_drawing = v4;

  -[PKTiledCanvasView setupGestures](self, "setupGestures");
}

- (void)set_fixedPixelSize:(CGSize)a3
{
  self->__fixedPixelSize = a3;
}

- (void)set_fixedDrawingScale:(double)a3
{
  self->__fixedDrawingScale = a3;
}

- (void)setSixChannelBlending:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (self->_sixChannelBlending != a3)
  {
    v3 = a3;
    self->_sixChannelBlending = a3;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setSixChannelBlending:]((uint64_t)v5, v3);

    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = 504;
      if (v3)
        v8 = 512;
      v9 = *(_QWORD *)(v6 + v8);
    }
    else
    {
      v9 = 0;
    }
    -[PKTiledCanvasView metalView](self, "metalView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalView setPixelFormat:]((uint64_t)v10, v9);

    -[PKTiledCanvasView _updateMetalLayerOpacity](self, "_updateMetalLayerOpacity");
  }
}

- (void)setSelectionController:(id)a3
{
  objc_storeWeak((id *)&self->_selectionController, a3);
}

- (void)setRulerController:(id)a3
{
  objc_storeWeak((id *)&self->_rulerController, a3);
}

- (void)setPurgeResourcesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (void)setOpaque:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTiledCanvasView;
  -[PKTiledCanvasView setOpaque:](&v4, sel_setOpaque_, a3);
  -[PKTiledCanvasView _updateMetalLayerOpacity](self, "_updateMetalLayerOpacity");
}

- (void)setInk:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  PKInk *v8;
  PKInk *sixChannelInk;
  id obj;
  id obja;

  obj = a3;
  -[PKTiledCanvasView _finishCombiningStrokesIfNecessary](self, "_finishCombiningStrokesIfNecessary");
  objc_msgSend(obj, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ink.marker"));

  if (v5)
  {
    v6 = objc_msgSend(obj, "_copyWithVariant:", CFSTR("linear"));

    v7 = (void *)v6;
  }
  else
  {
    v7 = obj;
  }
  obja = v7;
  objc_storeStrong((id *)&self->_ink, v7);
  objc_msgSend(obja, "_sixChannelVersion");
  v8 = (PKInk *)objc_claimAutoreleasedReturnValue();
  sixChannelInk = self->_sixChannelInk;
  self->_sixChannelInk = v8;

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[PKTiledCanvasView isHidden](self, "isHidden");
  if (v5 != v3)
    -[PKTiledCanvasView cancelPurgeResourcesBlock](self, "cancelPurgeResourcesBlock");
  v7.receiver = self;
  v7.super_class = (Class)PKTiledCanvasView;
  -[PKTiledCanvasView setHidden:](&v7, sel_setHidden_, v3);
  if (!(v5 | !v3))
  {
    -[PKTiledCanvasView schedulePurgeResourcesBlock](self, "schedulePurgeResourcesBlock");
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetFilters");

  }
}

- (void)setDrawingGestureRecognizer:(id)a3
{
  PKDrawingGestureRecognizerProtocol *v5;
  PKDrawingGestureRecognizerProtocol **p_drawingGestureRecognizer;
  PKDrawingGestureRecognizerProtocol *drawingGestureRecognizer;
  PKTiledCanvasView *v8;
  PKTiledCanvasView *v9;
  PKDrawingGestureRecognizerProtocol *v10;

  v5 = (PKDrawingGestureRecognizerProtocol *)a3;
  p_drawingGestureRecognizer = &self->_drawingGestureRecognizer;
  drawingGestureRecognizer = self->_drawingGestureRecognizer;
  if (drawingGestureRecognizer != v5)
  {
    v10 = v5;
    if (drawingGestureRecognizer)
    {
      -[PKDrawingGestureRecognizerProtocol delegate](drawingGestureRecognizer, "delegate");
      v8 = (PKTiledCanvasView *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        -[PKDrawingGestureRecognizerProtocol setDelegate:](*p_drawingGestureRecognizer, "setDelegate:", 0);
      -[PKDrawingGestureRecognizerProtocol drawingTarget](*p_drawingGestureRecognizer, "drawingTarget");
      v9 = (PKTiledCanvasView *)objc_claimAutoreleasedReturnValue();

      if (v9 == self)
        -[PKDrawingGestureRecognizerProtocol setDrawingTarget:](*p_drawingGestureRecognizer, "setDrawingTarget:", 0);
      -[PKTiledCanvasView removeGestureRecognizer:](self, "removeGestureRecognizer:", *p_drawingGestureRecognizer);
    }
    objc_storeStrong((id *)&self->_drawingGestureRecognizer, a3);
    v5 = v10;
  }

}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (void)setDrawBitmapEraserMask:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_drawBitmapEraserMask != a3)
  {
    v3 = a3;
    self->_drawBitmapEraserMask = a3;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v4, v3);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  $6AF91522889691011B0C2D3E90F36BFE *p_canvasViewFlags;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_canvasViewFlags = &self->_canvasViewFlags;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFF7F | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 256;
    else
      v14 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFEFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 512;
    else
      v15 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFDFF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 1024;
    else
      v16 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFBFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 2048;
    else
      v17 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xF7FF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 4096;
    else
      v18 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xEFFF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x2000;
    else
      v19 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xDFFF | v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 0x4000;
    else
      v20 = 0;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xBFFF | v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 0x8000;
    else
      v21 = 0;
    *(_WORD *)p_canvasViewFlags = v21 & 0x8000 | *(_WORD *)p_canvasViewFlags & 0x7FFF;
    p_canvasViewFlags->delegateSupportsTouchView = objc_opt_respondsToSelector() & 1;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 2;
    else
      v22 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFD | v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 4;
    else
      v23 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFB | v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = 8;
    else
      v24 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFF7 | v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 16;
    else
      v25 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFEF | v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = 32;
    else
      v26 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFDF | v26;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 64;
    else
      v27 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFBF | v27;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = 128;
    else
      v28 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFF7F | v28;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = 256;
    else
      v29 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFEFF | v29;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = 512;
    else
      v30 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFDFF | v30;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = 1024;
    else
      v31 = 0;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFBFF | v31;
    v5 = obj;
  }

}

- (void)setCurrentDrawingBeingCopiedToCanvas:(id)a3
{
  objc_storeWeak((id *)&self->_currentDrawingBeingCopiedToCanvas, a3);
}

- (void)schedulePurgeResourcesBlock
{
  dispatch_block_t v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  dispatch_time_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[PKTiledCanvasView cancelPurgeResourcesBlock](self, "cancelPurgeResourcesBlock");
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __48__PKTiledCanvasView_schedulePurgeResourcesBlock__block_invoke;
  v13 = &unk_1E7777B30;
  objc_copyWeak(&v14, &location);
  v3 = dispatch_block_create((dispatch_block_flags_t)0, &v10);
  -[PKTiledCanvasView setPurgeResourcesBlock:](self, "setPurgeResourcesBlock:", v3, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if (v6)
    v7 = 10000000000;
  else
    v7 = 2000000000;
  v8 = dispatch_time(0, v7);
  -[PKTiledCanvasView purgeResourcesBlock](self, "purgeResourcesBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v8, MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (PKRulerController)rulerController
{
  return (PKRulerController *)objc_loadWeakRetained((id *)&self->_rulerController);
}

- (void)resizeBackingBuffersForPixelSize:(CGSize)a3 drawingScale:(double)a4
{
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  PKMetalView *metalView;
  PKMetalView *v11;
  CGSize v12;
  CGSize v14;
  CGSize v15;

  v15 = a3;
  if (self->_metalView)
  {
    if (a4 <= 0.0)
    {
      v14 = v15;
    }
    else
    {
      v5 = 1.0 / a4;
      v14.width = a3.width * v5;
      v14.height = a3.height * v5;
    }
    -[PKTiledCanvasView adjustedPixelSize:drawingSize:](self, "adjustedPixelSize:drawingSize:", &v15, &v14);
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 64);
    else
      v8 = 0;
    v9 = v8;
    -[PKMetalRendererController setPixelSize:actualSize:]((uint64_t)v9, v15.width, v15.height, v14.width, v14.height);

    metalView = self->_metalView;
    -[PKTiledCanvasView bounds](self, "bounds");
    -[PKMetalView setFrame:](metalView, "setFrame:");
    v11 = self->_metalView;
    if (v11)
    {
      v12 = v15;
      if (v15.width == *MEMORY[0x1E0C9D820] && v15.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v11->_isFixedPixelSize = 0;
      }
      else
      {
        v11->_isFixedPixelSize = 1;
        v11->_fixedPixelSize = v12;
      }
    }
    -[PKMetalView resizeDrawableIfNecessary](self->_metalView);
  }
}

- (id)purgeResourcesBlock
{
  return self->_purgeResourcesBlock;
}

- (UIImage)paperTexture
{
  return self->_paperTexture;
}

- (PKMetalView)metalView
{
  return self->_metalView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BYTE *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKTiledCanvasView;
  -[PKTiledCanvasView layoutSubviews](&v23, sel_layoutSubviews);
  if (self->_metalView)
  {
    -[PKTiledCanvasView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[PKMetalView frame](self->_metalView, "frame");
    if (v4 != v8 || v6 != v7)
    {
      -[PKTiledCanvasView _fixedPixelSize](self, "_fixedPixelSize");
      v11 = v10;
      v13 = v12;
      -[PKTiledCanvasView _fixedDrawingScale](self, "_fixedDrawingScale");
      -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v11, v13, v14);
      -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
      v15 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v15[72] = 0;

      -[PKTiledCanvasView _rendererController](self, "_rendererController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRendererController changeRenderSize]((uint64_t)v16);

    }
  }
  -[PKTiledCanvasView traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceStyle");
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setInvertColors:]((uint64_t)v19, v18 == 2);

  LODWORD(v17) = -[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending");
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setSixChannelBlending:]((uint64_t)v20, (int)v17);

  LODWORD(v17) = -[PKTiledCanvasView drawBitmapEraserMask](self, "drawBitmapEraserMask");
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v21, (int)v17);

  -[PKTiledCanvasView rulerController](self, "rulerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerController ensureRulerIsFullyOnscreen]((uint64_t)v22);

}

- (double)layerContentsScale
{
  double result;

  result = self->_metalLayerContentsScaleOverride;
  if (result <= 0.0)
    +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  return result;
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (PKInk)ink
{
  return self->_ink;
}

- (PKTiledCanvasView)initWithFrame:(CGRect)a3 usePrivateResourceHandler:(BOOL)a4 singleComponent:(BOOL)a5 sixChannelBlending:(BOOL)a6
{
  PKTiledCanvasView *v9;
  PKTiledCanvasView *v10;
  PKTiledCanvasView *v11;
  PKMetalConfig *v12;
  PKMetalConfig *metalConfig;
  uint64_t v14;
  NSMutableArray *particlesToDestinationAnimations;
  uint64_t v16;
  NSMutableArray *transformStrokesAnimations;
  uint64_t v18;
  NSMutableSet *strokeUUIDsAboutToBeRemoved;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  PKShapeDrawingController *v25;
  PKShapeDrawingController *shapeDrawingController;
  PKShapeDrawingController *v27;
  PKScratchOutController *v28;
  PKScratchOutController *scratchOutController;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PKTiledCanvasView;
  v9 = -[PKTiledCanvasView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    v9->_usePrivateResourceHandler = a4;
    v12 = (PKMetalConfig *)-[PKMetalConfig initWithPrivateResourceHandler:]([PKMetalConfig alloc], a4);
    metalConfig = v11->_metalConfig;
    v11->_metalConfig = v12;

    v11->_singleComponent = a5;
    v11->_sixChannelBlending = a6;
    -[PKTiledCanvasView setupDrawing](v11, "setupDrawing");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    particlesToDestinationAnimations = v11->_particlesToDestinationAnimations;
    v11->_particlesToDestinationAnimations = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    transformStrokesAnimations = v11->_transformStrokesAnimations;
    v11->_transformStrokesAnimations = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    strokeUUIDsAboutToBeRemoved = v11->_strokeUUIDsAboutToBeRemoved;
    v11->_strokeUUIDsAboutToBeRemoved = (NSMutableSet *)v18;

    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.c = v21;
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.tx = v20;
    v11->_maxNumPredictionPoints = -1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("internalSettings.drawing.touchPredictionPointsOverride"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_maxNumPredictionPoints = objc_msgSend(v24, "integerForKey:", CFSTR("internalSettings.drawing.touchPredictionPointsOverride"));

    }
    v25 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], v11);
    shapeDrawingController = v11->_shapeDrawingController;
    v11->_shapeDrawingController = v25;

    v27 = v11->_shapeDrawingController;
    if (v27)
      v27->_fastDetectionEnabled = 1;
    v28 = objc_alloc_init(PKScratchOutController);
    scratchOutController = v11->_scratchOutController;
    v11->_scratchOutController = v28;

  }
  return v11;
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (PKDrawingGestureRecognizerProtocol)drawingGestureRecognizer
{
  return self->_drawingGestureRecognizer;
}

- (BOOL)drawBitmapEraserMask
{
  return self->_drawBitmapEraserMask;
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  os_log_t v5;
  uint64_t v6;
  _UICanvasFeedbackGenerator *v7;
  void *v8;
  _UICanvasFeedbackGenerator *v9;
  _UICanvasFeedbackGenerator *v10;
  _UICanvasFeedbackGenerator *feedbackGenerator;
  uint8_t v12[16];

  -[PKTiledCanvasView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      -[PKTiledCanvasView superview](self, "superview");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (os_log_t)v4;
        while ((-[NSObject isUserInteractionEnabled](v5, "isUserInteractionEnabled") & 1) == 0)
        {
          -[NSObject superview](v5, "superview");
          v6 = objc_claimAutoreleasedReturnValue();

          v5 = (os_log_t)v6;
          if (!v6)
            goto LABEL_7;
        }
        v10 = (_UICanvasFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4068]), "initWithView:", v5);
        feedbackGenerator = self->_feedbackGenerator;
        self->_feedbackGenerator = v10;

      }
      else
      {
LABEL_7:
        v5 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_error_impl(&dword_1BE213000, v5, OS_LOG_TYPE_ERROR, "Could not find view with user interaction enabled for canvas feedback.", v12, 2u);
        }
      }

    }
  }
  else
  {
    v7 = self->_feedbackGenerator;
    if (v7)
    {
      -[_UICanvasFeedbackGenerator view](v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeInteraction:", self->_feedbackGenerator);

      v9 = self->_feedbackGenerator;
      self->_feedbackGenerator = 0;

    }
  }
}

- (void)cancelPurgeResourcesBlock
{
  void *v3;
  void *v4;

  -[PKTiledCanvasView purgeResourcesBlock](self, "purgeResourcesBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKTiledCanvasView purgeResourcesBlock](self, "purgeResourcesBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

    -[PKTiledCanvasView setPurgeResourcesBlock:](self, "setPurgeResourcesBlock:", 0);
  }
}

- (void)_updateMetalLayerOpacity
{
  uint64_t v3;
  id v4;

  -[PKTiledCanvasView ink](self, "ink");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isEraserInk") & 1) != 0)
    v3 = 1;
  else
    v3 = -[PKTiledCanvasView hasSnapshot](self, "hasSnapshot") ^ 1;
  -[PKTiledCanvasView _updateMetalLayerOpacityForceNonOpaqueSixChannel:](self, "_updateMetalLayerOpacityForceNonOpaqueSixChannel:", v3);

}

- (void)_updateMetalLayerOpacityForceNonOpaqueSixChannel:(BOOL)a3
{
  int v3;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 sixChannelBlending;
  id *v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  CGColor *DeviceRGB;
  uint64_t v27;
  void *v28;
  id v29;
  id *v30;
  id v31;
  id v32;
  id *v33;
  id *v34;
  id v35;
  id v36;
  id *v37;
  id *v38;
  id *v39;
  id v40;
  id v41;
  UIColor *v42;
  UIColor *v43;
  id v44;

  v3 = a3;
  v5 = (-[PKTiledCanvasView isOpaque](self, "isOpaque") & 1) != 0
    || -[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending");
  if (-[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending"))
    v6 = v5 & ~v3;
  else
    v6 = v5;
  -[PKTiledCanvasView metalView](self, "metalView");
  v30 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOpaque:", v6);

  if ((v6 & 1) == 0)
  {
    -[PKTiledCanvasView ink](self, "ink");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderingDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "blendMode") == 1)
    {
      sixChannelBlending = self->_sixChannelBlending;

      if (sixChannelBlending)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E58]);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        -[PKTiledCanvasView metalView](self, "metalView");
        v11 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKMetalView metalLayer](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCompositingFilter:", v32);

        -[PKTiledCanvasView metalView](self, "metalView");
        v33 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKMetalView metalLayer](v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

        -[PKTiledCanvasView metalView](self, "metalView");
        v34 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKMetalView metalLayer](v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAllowsGroupBlending:", 0);

        -[PKTiledCanvasView metalView](self, "metalView");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

        -[PKTiledCanvasView metalView](self, "metalView");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAllowsGroupBlending:", 0);

LABEL_16:
        DeviceRGB = DKUCGColorCreateDeviceRGB(0.0, 0.0, 0.0, 0.0);
        -[PKTiledCanvasView _drawingController](self, "_drawingController");
        v27 = objc_claimAutoreleasedReturnValue();
        v44 = (id)v27;
        if (v27)
          v28 = *(void **)(v27 + 64);
        else
          v28 = 0;
        v29 = v28;
        -[PKMetalRendererController setBackgroundColor:]((uint64_t)v29, DeviceRGB);

        CGColorRelease(DeviceRGB);
        return;
      }
    }
    else
    {

    }
  }
  -[PKTiledCanvasView metalView](self, "metalView");
  v37 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCompositingFilter:", 0);

  -[PKTiledCanvasView metalView](self, "metalView");
  v38 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsGroupOpacity:", 1);

  -[PKTiledCanvasView metalView](self, "metalView");
  v39 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsGroupBlending:", 1);

  -[PKTiledCanvasView metalView](self, "metalView");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsGroupOpacity:", 1);

  -[PKTiledCanvasView metalView](self, "metalView");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAllowsGroupBlending:", 1);

  if ((v6 & 1) == 0)
    goto LABEL_16;
  v42 = self->_canvasBackgroundColor;
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 64);
  else
    v24 = 0;
  v25 = v24;
  v43 = objc_retainAutorelease(v42);
  -[PKMetalRendererController setBackgroundColor:]((uint64_t)v25, -[UIColor CGColor](v43, "CGColor"));

}

- (void)_setFixedPointSize:(CGSize)a3 drawingScale:(double)a4
{
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
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v6 = fmax(a3.width, 1.0);
  v7 = fmax(a3.height, 1.0);
  +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
  +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v6 * v8, v7 * v8);
  v10 = v9;
  v12 = v11;
  v13 = v9 / v6 * a4;
  -[PKTiledCanvasView _fixedPixelSize](self, "_fixedPixelSize");
  v16 = v15 == v10 && v14 == v12;
  if (!v16
    || (-[PKTiledCanvasView _fixedDrawingScale](self, "_fixedDrawingScale"), vabdd_f64(v17, v13) >= 0.00999999978))
  {
    -[PKTiledCanvasView set_fixedPixelSize:](self, "set_fixedPixelSize:", v10, v12);
    -[PKTiledCanvasView set_fixedDrawingScale:](self, "set_fixedDrawingScale:", v13);
    -[PKTiledCanvasView _fixedPixelSize](self, "_fixedPixelSize");
    v19 = v18;
    v21 = v20;
    -[PKTiledCanvasView _fixedDrawingScale](self, "_fixedDrawingScale");
    -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v19, v21, v22);
  }
}

- (PKMetalRendererController)_rendererController
{
  _QWORD *v2;
  void *v3;
  PKMetalRendererController *v4;

  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[8];
  v4 = v2;

  return v4;
}

- (CGSize)_fixedPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->__fixedPixelSize.width;
  height = self->__fixedPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)_fixedDrawingScale
{
  return self->__fixedDrawingScale;
}

- (void)_finishCombiningStrokesIfNecessary
{
  NSUUID *combineStrokesRenderGroupID;
  NSUUID *combineStrokesDrawingID;
  NSObject *v5;
  id combineTimeoutBlock;
  void *v7;
  uint8_t v8[16];

  self->_isCombiningStrokes = 0;
  self->_combiningStrokesCount = 0;
  combineStrokesRenderGroupID = self->_combineStrokesRenderGroupID;
  self->_combineStrokesRenderGroupID = 0;

  combineStrokesDrawingID = self->_combineStrokesDrawingID;
  self->_combineStrokesDrawingID = 0;

  if (self->_combineTimeoutBlock)
  {
    v5 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Finish combining manually triggered", v8, 2u);
    }

    dispatch_block_cancel(self->_combineTimeoutBlock);
    combineTimeoutBlock = self->_combineTimeoutBlock;
    self->_combineTimeoutBlock = 0;

    -[PKTiledCanvasView drawing](self, "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView didEndLiveInteractionWithStrokes:drawing:cancelled:](self, "didEndLiveInteractionWithStrokes:drawing:cancelled:", MEMORY[0x1E0C9AA60], v7, 0);

  }
}

- (PKController)_drawingController
{
  return self->_drawingController;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 52) = 0;
  return self;
}

+ (void)setupDefaults
{
  if (+[PKTiledCanvasView setupDefaults]::onceToken != -1)
    dispatch_once(&+[PKTiledCanvasView setupDefaults]::onceToken, &__block_literal_global_9);
}

+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(BOOL)a3 prewarmSharedResourceHandler:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;

  if (!a3)
  {
    v5 = a4;
    +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = !v5;
    else
      v7 = 1;
    if (!v7)
      v8 = +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v6);

  }
  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Began sketching"), CFSTR("Began sketching"), CFSTR("Localizable"));

  objc_msgSend(a1, "setupDefaults");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_86);
}

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PKTiledCanvasView;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1)
    +[PKTiledCanvasView setupDefaults](PKTiledCanvasView, "setupDefaults");
}

- (PKTiledCanvasView)initWithFrame:(CGRect)a3
{
  return -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:](self, "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  CADisplayLink *displayLink;
  id *v6;
  objc_super v7;

  -[PKTiledCanvasView cancelPurgeResourcesBlock](self, "cancelPurgeResourcesBlock");
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    -[PKMetalRendererController cancelLongRunningRenders](*(_QWORD *)(v3 + 64));

  -[PKTiledCanvasView _stopDisplayLink](self, "_stopDisplayLink");
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKController teardown](v6);

  v7.receiver = self;
  v7.super_class = (Class)PKTiledCanvasView;
  -[PKTiledCanvasView dealloc](&v7, sel_dealloc);
}

- (id)snapshotFramebufferWithSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  PKMetalFramebuffer **p_snapshotFramebuffer;
  PKMetalFramebuffer *v11;
  PKMetalFramebuffer *v12;
  double v13;
  BOOL v14;
  PKMetalFramebuffer *v15;
  _QWORD *v16;
  void *v17;
  id *v18;

  height = a3.height;
  width = a3.width;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6 && *(_BYTE *)(v6 + 489))
  {
    v8 = 554;
  }
  else
  {
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = v9[63];
    else
      v8 = 0;

  }
  p_snapshotFramebuffer = &self->_snapshotFramebuffer;
  v11 = self->_snapshotFramebuffer;
  v12 = v11;
  if (!v11
    || (-[PKMetalFramebuffer size]((uint64_t)v11) == width ? (v14 = v13 == height) : (v14 = 0),
        !v14 || v12->_pixelFormat != v8))
  {
    v15 = [PKMetalFramebuffer alloc];
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController device](v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)&v15->super.isa, (void *)v8, v17, 0, 1, (void *)1, 0, width, height);

    objc_storeStrong((id *)p_snapshotFramebuffer, v18);
    v12 = (PKMetalFramebuffer *)v18;
  }
  return v12;
}

- (void)setupMetalViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_metalView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __46__PKTiledCanvasView_setupMetalViewIfNecessary__block_invoke;
    v2[3] = &unk_1E7776F38;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

uint64_t __46__PKTiledCanvasView_setupMetalViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_fixedPixelSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_fixedPixelSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "_fixedDrawingScale");
  return objc_msgSend(v2, "setupViewWithPixelSize:drawingSize:", v4, v6, v8 * (1.0 / v11), v10 * (1.0 / v11));
}

- (void)setLinedPaper:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_linedPaper, a3);
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setLinedPaper:]((uint64_t)v5, v6);

}

- (void)setPaperTexture:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_paperTexture != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_paperTexture, a3);
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setPaperTextureImage:]((uint64_t)v6, -[UIImage CGImage](objc_retainAutorelease(v7), "CGImage"));

    v5 = v7;
  }

}

- (void)setLiveRenderingOverrideColor:(id)a3
{
  -[PKTiledCanvasView setLiveRenderingOverrideColor:animated:](self, "setLiveRenderingOverrideColor:animated:", a3, 0);
}

- (void)setLiveRenderingOverrideColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id *p_liveRenderingOverrideColor;
  UIColor *liveRenderingOverrideColor;
  id v10;
  void *v11;
  char v12;
  PKInterpolateColorAnimation *liveRenderingOverrideColorAnimation;
  double v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  PKInterpolateColorAnimation *v20;
  PKInterpolateColorAnimation *v21;
  double v22;
  PKInterpolateColorAnimation *v23;
  void *v24;
  void *v25;
  unint64_t v26;

  v4 = a4;
  v7 = a3;
  p_liveRenderingOverrideColor = (id *)&self->_liveRenderingOverrideColor;
  liveRenderingOverrideColor = self->_liveRenderingOverrideColor;
  v26 = (unint64_t)v7;
  v10 = liveRenderingOverrideColor;
  v11 = (void *)v26;
  if (v26 | (unint64_t)v10)
  {
    if (!v26 || !v10)
    {

      if (v4)
      {
LABEL_6:
        liveRenderingOverrideColorAnimation = self->_liveRenderingOverrideColorAnimation;
        if (liveRenderingOverrideColorAnimation)
        {
          v14 = CACurrentMediaTime();
          -[PKInterpolateColorAnimation colorAtTime:]((uint64_t)liveRenderingOverrideColorAnimation, v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!*p_liveRenderingOverrideColor)
          {
            -[PKTiledCanvasView ink](self, "ink");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "color");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          v15 = *p_liveRenderingOverrideColor;
        }
        v16 = v15;
LABEL_13:
        if (v26)
        {
          v17 = (id)v26;
        }
        else
        {
          -[PKTiledCanvasView ink](self, "ink");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "color");
          v17 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_storeStrong((id *)&self->_liveRenderingOverrideColor, a3);
        if (v16 && v17)
        {
          v19 = CACurrentMediaTime();
          v20 = (PKInterpolateColorAnimation *)-[PKInterpolateColorAnimation initWithStartColor:endColor:startTime:duration:]((uint64_t)[PKInterpolateColorAnimation alloc], v16, v17, v19, 0.15);
          v21 = self->_liveRenderingOverrideColorAnimation;
          self->_liveRenderingOverrideColorAnimation = v20;

          -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
          if (v22 == 0.0)
            -[PKTiledCanvasView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", v19);
        }
        else
        {
          v23 = self->_liveRenderingOverrideColorAnimation;
          self->_liveRenderingOverrideColorAnimation = 0;

          -[PKTiledCanvasView _rendererController](self, "_rendererController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v24, (CGColorRef)objc_msgSend(*p_liveRenderingOverrideColor, "CGColor"));

        }
        goto LABEL_22;
      }
LABEL_9:
      objc_storeStrong((id *)&self->_liveRenderingOverrideColor, a3);
      -[PKTiledCanvasView _rendererController](self, "_rendererController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v16, (CGColorRef)objc_msgSend(objc_retainAutorelease((id)v26), "CGColor"));
LABEL_22:

      v11 = (void *)v26;
      goto LABEL_23;
    }
    v12 = objc_msgSend((id)v26, "isEqual:", v10);

    v11 = (void *)v26;
    if ((v12 & 1) == 0)
    {
      if (v4)
        goto LABEL_6;
      goto LABEL_9;
    }
  }
LABEL_23:

}

- (void)setUseLuminanceColorFilter:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  self->_useLuminanceColorFilter = a3;
  -[PKTiledCanvasView metalView](self, "metalView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalView setUseLuminanceColorFilter:]((uint64_t)v4, v3);

}

- (void)setHasSnapshot:(BOOL)a3
{
  if (self->_hasSnapshot != a3)
  {
    self->_hasSnapshot = a3;
    -[PKTiledCanvasView _updateMetalLayerOpacity](self, "_updateMetalLayerOpacity");
  }
}

- (void)updateHasVisibleStrokes
{
  void *v3;
  _BOOL4 v4;
  id v5;
  id v6;

  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count")
    || self->_liveInteractionCount > 0
    || -[PKTiledCanvasView _isLiveAnimating](self, "_isLiveAnimating");

  if (self->_hasVisibleStrokes != v4)
  {
    self->_hasVisibleStrokes = v4;
    if ((*((_BYTE *)&self->_canvasViewFlags + 16) & 4) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "canvasViewHasVisibleStrokesChanged:", self);

    }
  }
}

- (void)setLiveStrokeMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_liveStrokeMode != a3)
  {
    v3 = a3;
    self->_liveStrokeMode = a3;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setFadeOutStrokesMode:]((uint64_t)v5, v3);

    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeMode:]((uint64_t)v6, v3);

  }
}

- (void)setLiveStrokeMaxSize:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  if (self->_liveStrokeMaxSize.width != a3.width || self->_liveStrokeMaxSize.height != a3.height)
  {
    self->_liveStrokeMaxSize = a3;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeMaxSize:]((uint64_t)v6, width, height);

  }
}

- (void)enumerateRenderedStrokesBounds:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKTiledCanvasView _drawingController](self, "_drawingController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "_bounds");
        v4[2](v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (CGRect)renderedStrokesBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v24 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PKTiledCanvasView _drawingController](self, "_drawingController", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "_bounds");
        v28.origin.x = v11;
        v28.origin.y = v12;
        v28.size.width = v13;
        v28.size.height = v14;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)visibleStrokesBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect result;
  CGRect v65;
  CGRect v66;

  v57 = *MEMORY[0x1E0C80C00];
  -[PKTiledCanvasView renderedStrokesBounds](self, "renderedStrokesBounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = self->_fadeOutStrokeAnimations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v51;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v14), "stroke");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_bounds");
        v65.origin.x = v16;
        v65.origin.y = v17;
        v65.size.width = v18;
        v65.size.height = v19;
        v58.origin.x = x;
        v58.origin.y = y;
        v58.size.width = width;
        v58.size.height = height;
        v59 = CGRectUnion(v58, v65);
        x = v59.origin.x;
        y = v59.origin.y;
        width = v59.size.width;
        height = v59.size.height;

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v12);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = self->_particlesToDestinationAnimations;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v47;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v23), "bounds");
        v66.origin.x = v24;
        v66.origin.y = v25;
        v66.size.width = v26;
        v66.size.height = v27;
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        v61 = CGRectUnion(v60, v66);
        x = v61.origin.x;
        y = v61.origin.y;
        width = v61.size.width;
        height = v61.size.height;
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v21);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = self->_transformStrokesAnimations;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v43;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD **)(*((_QWORD *)&v42 + 1) + 8 * v31);
        if (v32)
        {
          v33 = v32[13];
          v34 = v32[14];
          v35 = v32[15];
          v36 = v32[16];
        }
        else
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v33 = 0;
        }
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
        v63 = CGRectUnion(v62, *(CGRect *)&v33);
        x = v63.origin.x;
        y = v63.origin.y;
        width = v63.size.width;
        height = v63.size.height;
        ++v31;
      }
      while (v29 != v31);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      v29 = v37;
    }
    while (v37);
  }

  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)setCanvasBackgroundColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_canvasBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_canvasBackgroundColor, a3);
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setBackgroundColor:]((uint64_t)v5, (CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));

  }
}

- (void)setResourceCacheSize:(unint64_t)a3
{
  id v4;

  self->_resourceCacheSize = a3;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setResourceCacheSize:]((uint64_t)v4, a3);

}

- (void)adjustedPixelSize:(CGSize *)a3 drawingSize:(CGSize *)a4
{
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double metalLayerContentsScaleOverride;
  CGFloat v14;
  CGFloat v15;

  height = a3->height;
  if (a3->width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PKTiledCanvasView bounds](self, "bounds", a3->width, height);
    v10 = fmax(v9, 1.0);
    v12 = fmax(v11, 1.0);
    metalLayerContentsScaleOverride = self->_metalLayerContentsScaleOverride;
    if (metalLayerContentsScaleOverride <= 0.0)
      +[PKMetalUtility layerContentsScale](PKMetalUtility, "layerContentsScale");
    +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v10 * metalLayerContentsScaleOverride, v12 * metalLayerContentsScaleOverride);
    a3->width = v14;
    a3->height = v15;
    a4->width = v10;
    a4->height = v12;
  }
}

- (void)setupViewWithPixelSize:(CGSize)a3 drawingSize:(CGSize)a4
{
  PKController *v5;
  PKController *v6;
  PKController *drawingController;
  PKController *v8;
  _BOOL4 drawBitmapEraserMask;
  _BOOL8 v10;
  void *v11;
  PKController *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  PKMetalView *metalView;
  CGFloat width;
  CGFloat height;
  CGFloat *p_width;
  void *v29;
  void *v30;
  UIColor *canvasBackgroundColor;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CGSize v36;
  CGSize v37;

  v37 = a3;
  v36 = a4;
  if (!self->_drawingController)
  {
    -[PKTiledCanvasView adjustedPixelSize:drawingSize:](self, "adjustedPixelSize:drawingSize:", &v37, &v36);
    v5 = [PKController alloc];
    v6 = (PKController *)-[PKController initWithPixelSize:actualSize:singleComponent:sixChannelBlending:metalConfig:](v5, self->_singleComponent, -[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending"), self->_metalConfig, v37.width, v37.height, v36.width, v36.height);
    drawingController = self->_drawingController;
    self->_drawingController = v6;

    v8 = self->_drawingController;
    if (v8)
    {
      drawBitmapEraserMask = self->_drawBitmapEraserMask;
      if (v8->_drawBitmapEraserMask != drawBitmapEraserMask)
      {
        v8->_drawBitmapEraserMask = drawBitmapEraserMask;
        -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v8->_rendererController, drawBitmapEraserMask);
      }
    }
    v10 = -[PKTiledCanvasView captureLiveData](self, "captureLiveData", *(_QWORD *)&v36.width, *(_QWORD *)&v36.height);
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCaptureLiveData:", v10);

    v12 = self->_drawingController;
    if (v12)
      objc_storeWeak((id *)&v12->_delegate, self);
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setBackboardPaperMultiply:]((uint64_t)v13, 1.0);

    if (self->_resourceCacheSize)
    {
      -[PKTiledCanvasView _rendererController](self, "_rendererController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRendererController setResourceCacheSize:]((uint64_t)v14, self->_resourceCacheSize);

    }
    v15 = -[PKTiledCanvasView liveStrokeMode](self, "liveStrokeMode");
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setFadeOutStrokesMode:]((uint64_t)v16, v15);

    v17 = -[PKTiledCanvasView liveStrokeMode](self, "liveStrokeMode");
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeMode:]((uint64_t)v18, v17);

    LOBYTE(v17) = -[PKTiledCanvasView isPDFCanvasForAnalytics](self, "isPDFCanvasForAnalytics");
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setIsPDFCanvasForAnalytics:]((uint64_t)v19, v17);

  }
  v20 = -[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending", *(_QWORD *)&v36.width, *(_QWORD *)&v36.height);
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = 504;
    if (v20)
      v22 = 512;
    v23 = *(_QWORD *)&v21[v22];
  }
  else
  {
    v23 = 0;
  }

  -[PKTiledCanvasView setupMetalViewForPixelFormat:withPixelSize:](self, "setupMetalViewForPixelFormat:withPixelSize:", v23, v37.width, v37.height);
  metalView = self->_metalView;
  if (metalView)
  {
    width = v37.width;
    height = v37.height;
    if (v37.width == *MEMORY[0x1E0C9D820] && v37.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      metalView->_isFixedPixelSize = 0;
    }
    else
    {
      metalView->_isFixedPixelSize = 1;
      p_width = &metalView->_fixedPixelSize.width;
      *p_width = width;
      p_width[1] = height;
    }
  }
  -[PKMetalView resizeDrawableIfNecessary](self->_metalView);
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer]((id *)&self->_metalView->super.super.super.isa);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setPresentationLayer:]((uint64_t)v29, v30);

  canvasBackgroundColor = self->_canvasBackgroundColor;
  v32 = canvasBackgroundColor;
  if (!canvasBackgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKTiledCanvasView setCanvasBackgroundColor:](self, "setCanvasBackgroundColor:", v32);
  if (!canvasBackgroundColor)

  -[PKTiledCanvasView linedPaper](self, "linedPaper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[PKTiledCanvasView linedPaper](self, "linedPaper");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLinedPaper:]((uint64_t)v35, v34);

  }
}

- (void)setupMetalViewForPixelFormat:(unint64_t)a3 withPixelSize:(CGSize)a4
{
  double height;
  double width;
  unint64_t v7;
  PKMetalView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PKMetalView *v13;
  PKMetalView *metalView;

  height = a4.height;
  width = a4.width;
  if (a3)
    v7 = a3;
  else
    v7 = 80;
  v8 = [PKMetalView alloc];
  -[PKTiledCanvasView bounds](self, "bounds");
  v13 = (PKMetalView *)-[PKMetalView initWithFrame:andPixelSize:pixelFormat:](v8, (void *)v7, v9, v10, v11, v12, width, height);
  metalView = self->_metalView;
  self->_metalView = v13;

  -[PKMetalView setOpaque:](self->_metalView, "setOpaque:", 1);
  -[PKMetalView setTranslatesAutoresizingMaskIntoConstraints:](self->_metalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKMetalView setUseLuminanceColorFilter:]((uint64_t)self->_metalView, -[PKTiledCanvasView useLuminanceColorFilter](self, "useLuminanceColorFilter"));
  -[PKTiledCanvasView _updateMetalLayerOpacity](self, "_updateMetalLayerOpacity");
  -[PKTiledCanvasView addSubview:](self, "addSubview:", self->_metalView);
  -[PKTiledCanvasView setupDisplayLink](self, "setupDisplayLink");
}

- (void)setMetalLayerContentsScaleOverride:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_metalLayerContentsScaleOverride != a3)
  {
    self->_metalLayerContentsScaleOverride = a3;
    -[PKTiledCanvasView _fixedPixelSize](self, "_fixedPixelSize");
    v5 = v4;
    v7 = v6;
    -[PKTiledCanvasView _fixedDrawingScale](self, "_fixedDrawingScale");
    -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v5, v7, v8);
  }
}

- (void)setupDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;
  PKTiledCanvasViewDisplayLinkDelegate *v7;
  CAFrameRateRange v8;

  if (!self->_displayLink)
  {
    v7 = objc_alloc_init(PKTiledCanvasViewDisplayLinkDelegate);
    -[PKTiledCanvasViewDisplayLinkDelegate setView:](v7, "setView:", self);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v7, sel_display_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
    -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1507329);
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  }
}

- (BOOL)_isDisplayLinkPaused
{
  if (_UIUpdateCycleEnabled())
    return self->_updateSequenceVSyncItem == 0;
  else
    return -[CADisplayLink isPaused](self->_displayLink, "isPaused");
}

- (void)_startDisplayLinkShouldPause:(BOOL)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10[6];
  id v11;
  id location;

  self->_shouldPause = a3;
  v4 = _UIUpdateCycleEnabled();
  if (_UIUpdateCycleEnabled() && !self->_updateSequenceItem)
  {
    objc_initWeak(&location, self);
    _UIUpdateRequestActivate();
    v5 = MEMORY[0x1E0C809B0];
    v10[1] = (id)MEMORY[0x1E0C809B0];
    v10[2] = (id)3221225472;
    v10[3] = __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke;
    v10[4] = &unk_1E77781E8;
    objc_copyWeak(&v11, &location);
    v10[5] = self;
    self->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    v6 = v5;
    v7 = 3221225472;
    v8 = __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke_2;
    v9 = &unk_1E7778210;
    objc_copyWeak(v10, &location);
    self->_updateSequenceVSyncItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    objc_destroyWeak(v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    if ((v4 & 1) != 0)
      return;
  }
  else if ((v4 & 1) != 0)
  {
    return;
  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0, v6, v7, v8, v9);
}

void __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_rendererController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController updateCyclePreCACommit:isDrawing:]((uint64_t)v3, objc_msgSend(*(id *)(a1 + 32), "isDrawing"));

    WeakRetained = v4;
  }

}

void __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _UIMediaTimeForMachTime();
  objc_msgSend(WeakRetained, "_updateSequenceVSync:");

}

- (void)_stopDisplayLink
{
  if (_UIUpdateCycleEnabled() && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceVSyncItem = 0;
    _UIUpdateRequestDeactivate();
  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
  self->_shouldPause = 0;
}

- (BOOL)_isShapeRecognitionEnabled
{
  char v3;
  void *v4;

  if ((PKDisableShapeRecognition() & 1) != 0)
    return 0;
  -[PKTiledCanvasView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "canvasViewAllowSnapToShape:", self);

  return v3;
}

- (void)setNeedsDrawingDisplay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKTiledCanvasView_setNeedsDrawingDisplay__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__PKTiledCanvasView_setNeedsDrawingDisplay__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isDisplayLinkPaused");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_startDisplayLinkShouldPause:", 1);
  return result;
}

- (BOOL)_isLiveAnimating
{
  double v3;
  BOOL v4;
  void *v6;
  void *v7;

  if (self->_alternativeStrokesAnimation)
    return 1;
  -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
  if (v3 > 0.0)
    return 1;
  if (!-[PKTiledCanvasView liveStrokeMode](self, "liveStrokeMode"))
    return 0;
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "count") != 0;

  return v4;
}

- (BOOL)_isCombiningStrokes
{
  return self->_isCombiningStrokes;
}

- (id)_combineStrokesDrawingUUID
{
  return self->_combineStrokesDrawingID;
}

- (void)handleDrawingShouldPause:(BOOL)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  _QWORD block[4];
  void (**v6)(_QWORD);
  _QWORD aBlock[5];
  BOOL v8;

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke;
  aBlock[3] = &unk_1E7778538;
  v8 = a3;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2](v4);
  }
  else
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke_2;
    block[3] = &unk_1E7776F60;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *v3;
  _BYTE *v4;
  _BOOL4 v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(_BYTE **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_drawingController");
    v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v5 = !v4 || (v4[48] & 1) == 0 || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 615) != 0;

    v3 = *(_BYTE **)(a1 + 32);
  }
  else
  {
    v5 = v3[615] != 0;
  }
  result = objc_msgSend(v3, "_isLiveAnimating");
  if ((result & 1) == 0 && v5)
    return objc_msgSend(*(id *)(a1 + 32), "_stopDisplayLink");
  return result;
}

uint64_t __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reduceMemoryFootprint
{
  _QWORD block[5];

  -[PKTiledCanvasView cancelCurrentStroke](self, "cancelCurrentStroke");
  -[PKTiledCanvasView _stopDisplayLink](self, "_stopDisplayLink");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKTiledCanvasView__reduceMemoryFootprint__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__PKTiledCanvasView__reduceMemoryFootprint__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeResources");
}

- (void)_purgeResources
{
  PKMetalFramebuffer *snapshotFramebuffer;
  void *v4;
  void *v5;

  if (-[PKTiledCanvasView isHidden](self, "isHidden"))
  {
    snapshotFramebuffer = self->_snapshotFramebuffer;
    self->_snapshotFramebuffer = 0;

    -[PKMetalView flushDrawables]((uint64_t)self->_metalView);
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController purgeOriginalBackFramebuffer]((uint64_t)v4);

    if (-[NSMutableArray count](self->_strokeRenderCachesToPurge, "count"))
    {
      -[PKTiledCanvasView _rendererController](self, "_rendererController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRendererController purgeRenderCachesForStrokes:]((uint64_t)v5, self->_strokeRenderCachesToPurge);

      -[NSMutableArray removeAllObjects](self->_strokeRenderCachesToPurge, "removeAllObjects");
    }
  }
}

void __48__PKTiledCanvasView_schedulePurgeResourcesBlock__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  char v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isHidden"))
    {
      if ((objc_msgSend(WeakRetained, "isDrawing") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "_drawingController");
        v1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        if (!v1 || (v2 = v1[48], v1, (v2 & 1) == 0))
          objc_msgSend(WeakRetained, "_purgeResources");
      }
    }
    objc_msgSend(WeakRetained, "setPurgeResourcesBlock:", 0);
  }

}

- (void)_didFinishHideCanvasTransaction
{
  id v2;

  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setCombineStrokesAllowed:]((uint64_t)v2, 0);

}

- (void)_drawingDisplay:(double)a3
{
  if (!_UIUpdateCycleEnabled() || !self->_updateSequenceVSyncItem)
    -[PKTiledCanvasView _updateSequenceVSync:](self, "_updateSequenceVSync:", a3);
}

- (void)_updateSequenceVSync:(double)a3
{
  double v5;
  _BOOL4 v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  PKMetalView *metalView;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  PKTiledCanvasView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unsigned __int8 *v26;
  int v27;
  void *v28;
  double v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  id WeakRetained;
  uint64_t v34;
  double x;
  double y;
  double width;
  double height;
  void *v39;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  char v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  void *v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  PKAlternativeStrokesAnimation *v91;
  uint64_t v92;
  double v93;
  double v94;
  uint64_t liveRenderingOverrideColorAnimation;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  _BOOL4 v104;
  PKTiledCanvasView *val;
  id obj;
  id obja;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  _QWORD v114[5];
  BOOL v115;
  _QWORD v116[5];
  id v117;
  _OWORD v118[3];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  v149 = *MEMORY[0x1E0C80C00];
  v5 = CACurrentMediaTime();
  v6 = -[PKTiledCanvasView _isLiveAnimating](self, "_isLiveAnimating");
  v7 = -[PKDrawingGestureRecognizerProtocol isReplaying](self->_drawingGestureRecognizer, "isReplaying");
  v104 = v6;
  val = self;
  if (v6)
  {
    -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
    v9 = v8;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeElapsedTime:]((uint64_t)v10, v5 - v9);

    -[PKTiledCanvasView isHidden](self, "isHidden");
  }
  else if (-[PKTiledCanvasView isHidden](self, "isHidden"))
  {
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (v11[48] & 1) != 0 || val->_isErasingObjects)
    {

      self = val;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&val->_currentDrawingBeingCopiedToCanvas);

      self = val;
      if (!WeakRetained)
      {
        -[PKTiledCanvasView handleDrawingShouldPause:](val, "handleDrawingShouldPause:", 1);
        return;
      }
    }
  }
  metalView = self->_metalView;
  if (metalView
    && metalView->_doubleBuffered
    && (-[CAMetalLayer isDrawableAvailable](metalView->_metalLayer, "isDrawableAvailable") & 1) == 0)
  {
    v14 = self->_numSkippedDoubleBufferedFrames + 1;
    self->_numSkippedDoubleBufferedFrames = v14;
    if (v14 < 8)
      return;
    -[PKTiledCanvasView metalView](self, "metalView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalView setDoubleBuffered:]((uint64_t)v15, 0);

    self = val;
  }
  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    -[PKShapeDrawingController _checkDetectedStroke](v16);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "systemUptime");
  v20 = v19;

  v21 = val;
  -[PKTiledCanvasView drawingStartTimestamp](val, "drawingStartTimestamp");
  v23 = v22;
  -[CADisplayLink maximumRefreshRate](val->_displayLink, "maximumRefreshRate");
  if (v24 >= 0.00833333333)
    v25 = v24;
  else
    v25 = 0.00833333333;
  if (-[PKTiledCanvasView isDrawing](val, "isDrawing"))
  {
    -[PKTiledCanvasView powerSavingController](val, "powerSavingController");
    v26 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = v26[72];

      v21 = val;
      if (v27)
      {
        -[PKTiledCanvasView powerSavingController](val, "powerSavingController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDrawingPowerSavingController accumulateMovementForCurrentFrame]((uint64_t)v28, v29);

        v21 = val;
        v30 = v104;
        if (!val->_metalView)
          v30 = 1;
        if (((v30 | v7) & 1) == 0 && !-[PKTiledCanvasView isPreviewing](val, "isPreviewing"))
        {
          -[PKTiledCanvasView powerSavingController](val, "powerSavingController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[PKDrawingPowerSavingController shouldSkipFrameWithFrameStartTimestamp:framesAfterStart:]((_BOOL8)v31, (unint64_t)((v20 - v23) / v25), v20);

          v21 = val;
          if (v32)
          {
            kdebug_trace();
            return;
          }
        }
      }
    }
    else
    {
      v21 = val;
    }
  }
  if (-[PKTiledCanvasView isDrawing](v21, "isDrawing"))
  {
    -[PKTiledCanvasView powerSavingController](v21, "powerSavingController");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      *(_BYTE *)(v34 + 72) = 1;
      *(_QWORD *)(v34 + 48) = 0;
      *(_QWORD *)(v34 + 56) = 0;
      *(double *)(v34 + 64) = v20;
    }

    v21 = val;
  }
  -[PKMetalView resizeDrawableIfNecessary](v21->_metalView);
  if (-[PKTiledCanvasView liveStrokeMode](v21, "liveStrokeMode"))
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 100);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v41 = val->_fadeOutStrokeAnimations;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v148, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v140;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v140 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
          v46 = (void *)objc_msgSend(v45, "newStrokeAtTime:", v5);
          objc_msgSend(v40, "addObject:", v46);

          objc_msgSend(v45, "stroke");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "_strokeUUID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v48);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v148, 16);
      }
      while (v42);
    }

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    -[PKTiledCanvasView particlesToDestinationAnimations](val, "particlesToDestinationAnimations");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v49;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
    if (v50)
    {
      v108 = *(_QWORD *)v136;
      do
      {
        v110 = v50;
        for (j = 0; j != v110; ++j)
        {
          if (*(_QWORD *)v136 != v108)
            objc_enumerationMutation(obj);
          v52 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v134 = 0u;
          v112 = v52;
          objc_msgSend(v52, "strokes");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v132;
            do
            {
              for (k = 0; k != v54; ++k)
              {
                if (*(_QWORD *)v132 != v55)
                  objc_enumerationMutation(v53);
                v57 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * k);
                objc_msgSend(v57, "_strokeUUID");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v39, "containsObject:", v58);

                if ((v59 & 1) == 0)
                {
                  objc_msgSend(v40, "addObject:", v57);
                  objc_msgSend(v39, "addObject:", v57);
                }
              }
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
            }
            while (v54);
          }

          objc_msgSend(v112, "bounds");
          v154.origin.x = v60;
          v154.origin.y = v61;
          v154.size.width = v62;
          v154.size.height = v63;
          v150.origin.x = x;
          v150.origin.y = y;
          v150.size.width = width;
          v150.size.height = height;
          v151 = CGRectUnion(v150, v154);
          x = v151.origin.x;
          y = v151.origin.y;
          width = v151.size.width;
          height = v151.size.height;
        }
        v49 = obj;
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
      }
      while (v50);
    }

    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    -[PKTiledCanvasView transformStrokesAnimations](val, "transformStrokesAnimations");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v64;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
    if (v65)
    {
      obja = *(id *)v128;
      do
      {
        v66 = 0;
        v111 = v65;
        do
        {
          if (*(id *)v128 != obja)
            objc_enumerationMutation(v64);
          v113 = v66;
          v67 = *(_QWORD **)(*((_QWORD *)&v127 + 1) + 8 * v66);
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v68 = -[PKTransformStrokesAnimation newStrokesAtTime:]((uint64_t)v67, v5);
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
          if (v69)
          {
            v70 = *(_QWORD *)v124;
            do
            {
              for (m = 0; m != v69; ++m)
              {
                if (*(_QWORD *)v124 != v70)
                  objc_enumerationMutation(v68);
                v72 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * m);
                objc_msgSend(v72, "_strokeUUID");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend(v39, "containsObject:", v73);

                if ((v74 & 1) == 0)
                {
                  objc_msgSend(v40, "addObject:", v72);
                  objc_msgSend(v39, "addObject:", v72);
                }
              }
              v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
            }
            while (v69);
          }

          if (v67)
          {
            v75 = v67[13];
            v76 = v67[14];
            v77 = v67[15];
            v78 = v67[16];
          }
          else
          {
            v76 = 0;
            v77 = 0;
            v78 = 0;
            v75 = 0;
          }
          v64 = v109;
          v152.origin.x = x;
          v152.origin.y = y;
          v152.size.width = width;
          v152.size.height = height;
          v153 = CGRectUnion(v152, *(CGRect *)&v75);
          x = v153.origin.x;
          y = v153.origin.y;
          width = v153.size.width;
          height = v153.size.height;
          v66 = v113 + 1;
        }
        while (v113 + 1 != v111);
        v65 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
      }
      while (v65);
    }

    -[PKTiledCanvasView strokeUUIDsAboutToBeRemoved](val, "strokeUUIDsAboutToBeRemoved");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "unionSet:", v79);

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    -[PKTiledCanvasView _drawingController](val, "_drawingController");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController renderedStrokes](v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v120;
      do
      {
        for (n = 0; n != v82; ++n)
        {
          if (*(_QWORD *)v120 != v83)
            objc_enumerationMutation(v81);
          v85 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * n);
          objc_msgSend(v85, "_strokeUUID");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v39, "containsObject:", v86);

          if ((v87 & 1) == 0)
            objc_msgSend(v40, "addObject:", v85);
        }
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
      }
      while (v82);
    }

    +[PKDrawing sortStrokes:](PKDrawing, "sortStrokes:", v40);
    -[PKTiledCanvasView _rendererController](val, "_rendererController");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeStrokes:animationBounds:]((uint64_t)v88, v40, x, y, width, height);

    v21 = val;
  }
  if (v21->_alternativeStrokesAnimation)
  {
    -[PKTiledCanvasView _rendererController](v21, "_rendererController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    alternativeStrokesAnimation = val->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
      alternativeStrokesAnimation = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_strokes;
    v91 = alternativeStrokesAnimation;
    v92 = (uint64_t)val->_alternativeStrokesAnimation;
    v93 = -[PKAlternativeStrokesAnimation alphaAtTime:](v92, v5);
    v94 = -[PKAlternativeStrokesAnimation originalStrokeAlphaAtTime:](v92, v5);
    -[PKMetalRendererController setAlternativeStrokes:alpha:originalStrokeAlpha:]((uint64_t)v89, v91, v93, v94);

    v21 = val;
  }
  liveRenderingOverrideColorAnimation = (uint64_t)v21->_liveRenderingOverrideColorAnimation;
  if (liveRenderingOverrideColorAnimation)
  {
    -[PKInterpolateColorAnimation colorAtTime:](liveRenderingOverrideColorAnimation, v5);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _rendererController](val, "_rendererController");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_retainAutorelease(v96);
    -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v97, (CGColorRef)objc_msgSend(v98, "CGColor"));

    v21 = val;
  }
  if (v104)
  {
    -[PKTiledCanvasView checkAnimationsDidEndAtTime:](v21, "checkAnimationsDidEndAtTime:", v5);
    v21 = val;
  }
  -[PKTiledCanvasView _rendererController](v21, "_rendererController");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v118, 0, sizeof(v118));
  -[PKMetalRendererController prerenderWithTransform:inputScale:at:]((uint64_t)v99, v118, val->_inputScale, a3);

  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x3042000000;
  v116[3] = __Block_byref_object_copy__3;
  v116[4] = __Block_byref_object_dispose__3;
  objc_initWeak(&v117, val);
  val->_latestRenderTimestamp = CACurrentMediaTime();
  -[PKTiledCanvasView _drawingController](val, "_drawingController");
  v100 = objc_claimAutoreleasedReturnValue();
  v101 = (void *)v100;
  if (v100)
    v102 = *(void **)(v100 + 64);
  else
    v102 = 0;
  v103 = v102;
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __42__PKTiledCanvasView__updateSequenceVSync___block_invoke;
  v114[3] = &unk_1E7778238;
  v114[4] = v116;
  v115 = v104;
  -[PKMetalRendererController didFinishRendering:]((uint64_t)v103, v114);

  _Block_object_dispose(v116, 8);
  objc_destroyWeak(&v117);
}

void __42__PKTiledCanvasView__updateSequenceVSync___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  _BOOL8 v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (a2)
    v5 = *(_BYTE *)(a1 + 40) == 0;
  else
    v5 = 0;
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "handleDrawingShouldPause:", v5);

}

- (void)setIsUnderBlendedContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id *v5;

  v3 = a3;
  self->_isUnderBlendedContent = a3;
  -[PKTiledCanvasView metalView](self, "metalView");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsDisplayCompositing:", !v3);

}

- (void)setCaptureLiveData:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_captureLiveData = a3;
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureLiveData:", v3);

}

- (void)delayCompletionBlockUntilPresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD aBlock[4];
  id v9;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke;
    aBlock[3] = &unk_1E7776F60;
    v9 = v4;
    -[PKMetalRendererController callBlockAfterPresenting:]((uint64_t)v6, aBlock);

  }
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke_2;
  v7[3] = &unk_1E7776F38;
  v7[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawingDisplay:", 0.0);
}

- (void)_setDrawing:(id)a3 tiles:(id)a4 image:(CGImage *)a5 tileTransform:(CGAffineTransform *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  id v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (a5)
  {
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController device](v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKMetalUtility textureFromImage:device:](PKMetalUtility, "textureFromImage:device:", a5, v16);
    a5 = (CGImage *)objc_claimAutoreleasedReturnValue();

    v17 = *(_OWORD *)&a6->c;
    v23 = *(_OWORD *)&a6->a;
    v24 = v17;
    v25 = *(_OWORD *)&a6->tx;
    if (a5)
      v18 = (void *)*((_QWORD *)a5 + 3);
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
    v19 = *(_OWORD *)&a6->c;
    v23 = *(_OWORD *)&a6->a;
    v24 = v19;
    v25 = *(_OWORD *)&a6->tx;
  }
  v20 = v18;
  v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v22[0] = *MEMORY[0x1E0C9BAA8];
  v22[1] = v21;
  v22[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKTiledCanvasView _setDrawing:tiles:tileTransform:snapshotTexture:snapshotTextureTransform:completionBlock:](self, "_setDrawing:tiles:tileTransform:snapshotTexture:snapshotTextureTransform:completionBlock:", v12, v13, &v23, v20, v22, v14);

}

- (void)_setDrawing:(id)a3 tiles:(id)a4 tileTransform:(CGAffineTransform *)a5 snapshotTexture:(id)a6 snapshotTextureTransform:(CGAffineTransform *)a7 completionBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  __int128 v30[3];
  __int128 v31[3];
  _QWORD v32[4];
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD aBlock[4];
  void (**v39)(_QWORD);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id location[2];

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = (void (**)(_QWORD))a8;
  if (!v15)
  {
LABEL_5:
    if (v18)
      v18[2](v18);
    goto LABEL_12;
  }
  -[PKTiledCanvasView setupMetalViewIfNecessary](self, "setupMetalViewIfNecessary");
  -[PKTiledCanvasView setHasSnapshot:](self, "setHasSnapshot:", v17 != 0);
  if (self->_liveInteractionCount >= 1 && objc_msgSend(v15, "_isEmpty"))
  {
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController setLiveInteractionDrawing:]((uint64_t)v19, v15);

    objc_storeStrong((id *)&self->_drawing, a3);
    goto LABEL_5;
  }
  v29 = v16;
  objc_initWeak(location, self);
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  -[PKTiledCanvasView scaledStrokeTransform](self, "scaledStrokeTransform");
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke;
  aBlock[3] = &unk_1E7778260;
  objc_copyWeak(&v40, location);
  v41 = v44;
  v42 = v45;
  v43 = v46;
  v39 = v18;
  v21 = _Block_copy(aBlock);
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_2;
  v34[3] = &unk_1E7778288;
  objc_copyWeak(&v37, location);
  v22 = v15;
  v35 = v22;
  v23 = v21;
  v36 = v23;
  v24 = _Block_copy(v34);
  if (v29 || !v17)
  {
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v27 = *(_OWORD *)&a5->c;
    v31[0] = *(_OWORD *)&a5->a;
    v31[1] = v27;
    v31[2] = *(_OWORD *)&a5->tx;
    v28 = *(_OWORD *)&a7->c;
    v30[0] = *(_OWORD *)&a7->a;
    v30[1] = v28;
    v30[2] = *(_OWORD *)&a7->tx;
    -[PKController setDrawing:tiles:tileTransform:contentImageTexture:contentImageTextureTransform:completionBlock:](v26, v22, v29, v31, v17, v30, v24);
  }
  else
  {
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472;
    v32[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_4;
    v32[3] = &unk_1E7776F60;
    v33 = v24;
    -[PKController setDrawing:imageTexture:completion:]((uint64_t)v25, v22, v17, v32);

    v26 = v33;
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
  v16 = v29;
LABEL_12:

}

uint64_t __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke(uint64_t a1)
{
  __int128 v2;
  id WeakRetained;
  void *v4;
  uint64_t result;
  __int128 v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v2;
  v9 = *(_OWORD *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_rendererController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  -[PKMetalRendererController setStrokeTransform:]((uint64_t)v4, v6);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_3;
  block[3] = &unk_1E7777440;
  v3 = WeakRetained;
  v5 = v3;
  v6 = *(id *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  objc_msgSend(v3, "delayCompletionBlockUntilPresentation:", *(_QWORD *)(a1 + 40));

}

void *__110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_3(uint64_t a1)
{
  void *result;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "drawing");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawing");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mergeWithDrawing:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v7 = *(void **)(v8 + 656);
      *(_QWORD *)(v8 + 656) = v9;
    }

    return (void *)objc_msgSend(*(id *)(a1 + 32), "setupDisplayLink");
  }
  return result;
}

uint64_t __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKDrawing)activeDrawing
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKTiledCanvasView currentDrawingBeingCopiedToCanvas](self, "currentDrawingBeingCopiedToCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKTiledCanvasView drawing](self, "drawing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (PKDrawing *)v6;
}

- (void)drawingChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  PKTiledCanvasView *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __36__PKTiledCanvasView_drawingChanged___block_invoke;
  v11 = &unk_1E7777440;
  v12 = self;
  v6 = v5;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(&v8);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v8, v9, v10, v11, v12))
    v7[2](v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __36__PKTiledCanvasView_drawingChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  _WORD *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "drawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "drawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeWithDrawing:", *(_QWORD *)(a1 + 40));

  }
  v7 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_drawingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController renderedStrokes](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2048;
    v17 = objc_msgSend(v13, "count");
    _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "Drawing changed %@, renderedStrokes: %lu", (uint8_t *)&v14, 0x16u);

  }
  v8 = *(_WORD **)(a1 + 32);
  if ((v8[228] & 1) != 0)
  {
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canvasView:drawingDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    v8 = *(_WORD **)(a1 + 32);
  }
  return objc_msgSend(v8, "updateHasVisibleStrokes");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  -[PKTiledCanvasView allowSimultaneousGR](self, "allowSimultaneousGR");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v6)
    {
      v11 = 1;
    }
    else
    {
      -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10 == v7;

    }
    v12 = (v8 == v6 || v8 == v7) && v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  NSClassFromString(CFSTR("_UITextSelectionForceGesture"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a4;
  if ((*(_WORD *)&self->_canvasViewFlags & 0x1000) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "canvasView:shouldBeginDrawingWithTouch:", self, v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "_gestureRecognizerFailed called for drawing gesture recognizer", v7, 2u);
    }

    objc_msgSend(v4, "cancel");
  }

}

- (id)_touchView
{
  PKTiledCanvasView *v2;
  PKTiledCanvasView *v3;
  void *v4;
  PKTiledCanvasView *v5;
  PKTiledCanvasView *v6;
  PKTiledCanvasView *v7;

  v2 = self;
  v3 = v2;
  if (v2->_canvasViewFlags.delegateSupportsTouchView)
  {
    -[PKTiledCanvasView delegate](v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canvasViewTouchView:", v3);
    v5 = (PKTiledCanvasView *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v2;
  }
  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (id)currentStroke
{
  void *v2;
  void *v3;

  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newStrokeWithCurrentData");

  return v3;
}

- (id)currentStrokeWithStrokeDataCopy
{
  void *v2;
  void *v3;

  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newStrokeWithCurrentDataCopy");

  return v3;
}

- (void)cancelCurrentStroke
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "cancelCurrentStroke called", v5, 2u);
  }

  -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (id)liveDrawing
{
  void *v3;
  PKDrawing *v4;

  -[PKTiledCanvasView currentStrokeWithStrokeDataCopy](self, "currentStrokeWithStrokeDataCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PKDrawing updateStroke:indexHint:](self->_drawing, "updateStroke:indexHint:", v3, -[PKDrawing _rootStrokesCount](self->_drawing, "_rootStrokesCount") - 1);
  v4 = self->_drawing;

  return v4;
}

- (double)_inputScale
{
  double a;
  double b;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform v12;

  -[PKTiledCanvasView strokeTransform](self, "strokeTransform");
  CGAffineTransformInvert(&v12, &v11);
  a = v12.a;
  b = v12.b;
  -[PKTiledCanvasView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView convertSize:toView:](self, "convertSize:toView:", v5, 1.0, 1.0);
  v7 = v6;
  v8 = sqrt(b * b + a * a);

  if (v7 <= 0.0)
    v9 = 1.0;
  else
    v9 = v7;
  return v8 / v9;
}

- (CGAffineTransform)strokeTransform
{
  uint64_t v4;
  void *v5;
  CGAffineTransform *result;
  id v7;

  -[PKTiledCanvasView _touchView](self, "_touchView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  PKDynamicCast(v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView strokeTransformForAttachment:](self, "strokeTransformForAttachment:", v5);

  return result;
}

- (CGAffineTransform)_strokeTransformForAttachment:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  CGAffineTransform *result;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v6 = a4;
  memset(&v21, 0, sizeof(v21));
  -[PKTiledCanvasView _replayCoordinateSystemTransform](self, "_replayCoordinateSystemTransform");
  v20 = v21;
  if (!CGAffineTransformIsIdentity(&v20))
  {
    v9 = *(_OWORD *)&v21.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v21.a;
    *(_OWORD *)&retstr->c = v9;
    v10 = *(_OWORD *)&v21.tx;
LABEL_9:
    *(_OWORD *)&retstr->tx = v10;
    goto LABEL_10;
  }
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x80) == 0
    || (-[PKTiledCanvasView delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "canvasViewContentCoordinateSpace:", self),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (v6)
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
      objc_msgSend(v6, "tileContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v11, self, retstr);

      objc_msgSend(v6, "drawingTransform");
      v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v17.c = v12;
      *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v19, &t1, &v17);
      v13 = *(_OWORD *)&v19.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
      *(_OWORD *)&retstr->c = v13;
      v10 = *(_OWORD *)&v19.tx;
    }
    else
    {
      v14 = MEMORY[0x1E0C9BAA8];
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&retstr->c = v15;
      v10 = *(_OWORD *)(v14 + 32);
    }
    goto LABEL_9;
  }
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v8, self, retstr);

LABEL_10:
  return result;
}

- (CGAffineTransform)scaledStrokeTransform
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGAffineTransform v9;
  CGAffineTransform t1;

  -[PKTiledCanvasView strokeTransform](self, "strokeTransform");
  -[PKTiledCanvasView layerContentsScale](self, "layerContentsScale");
  v6 = v5;
  -[PKTiledCanvasView layerContentsScale](self, "layerContentsScale");
  CGAffineTransformMakeScale(&v9, v6, v7);
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (void)willBeginLiveInteractionWithTouch:(id)a3
{
  id v5;
  int64_t liveInteractionCount;
  id combineTimeoutBlock;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  _BOOL4 isCombiningStrokes;
  NSUUID *v14;
  NSUUID *combineStrokesRenderGroupID;
  void *v16;
  NSUUID *v17;
  NSUUID *combineStrokesDrawingID;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_currentStrokeTouch, a3);
  liveInteractionCount = self->_liveInteractionCount;
  self->_liveInteractionCount = liveInteractionCount + 1;
  if (liveInteractionCount)
  {
    if (self->_combineTimeoutBlock)
    {
      self->_liveInteractionCount = liveInteractionCount;
      dispatch_block_cancel(self->_combineTimeoutBlock);
      combineTimeoutBlock = self->_combineTimeoutBlock;
      self->_combineTimeoutBlock = 0;

    }
  }
  else
  {
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Canvas live interaction did begin", v21, 2u);
    }

    -[PKTiledCanvasView ink](self, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_supportsCombiningStrokes");

    if (v10
      && ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x40) == 0
       || (-[PKTiledCanvasView delegate](self, "delegate"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v11, "canvasViewShouldCombineStrokes:", self),
           v11,
           v12)))
    {
      isCombiningStrokes = 1;
      if (!self->_isCombiningStrokes)
      {
        self->_isCombiningStrokes = 1;
        self->_combiningStrokesCount = 0;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        combineStrokesRenderGroupID = self->_combineStrokesRenderGroupID;
        self->_combineStrokesRenderGroupID = v14;

        -[PKTiledCanvasView activeDrawing](self, "activeDrawing");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        combineStrokesDrawingID = self->_combineStrokesDrawingID;
        self->_combineStrokesDrawingID = v17;

        isCombiningStrokes = self->_isCombiningStrokes;
      }
    }
    else
    {
      isCombiningStrokes = 0;
      self->_isCombiningStrokes = 0;
    }
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setCombineStrokesAllowed:]((uint64_t)v19, isCombiningStrokes);

    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController didStartLiveInteraction]((uint64_t)v20);

    -[PKTiledCanvasView updateHasVisibleStrokes](self, "updateHasVisibleStrokes");
  }

}

- (BOOL)wantsCanvasVisible
{
  return self->_liveInteractionCount > 0;
}

- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5
{
  -[PKTiledCanvasView didEndLiveInteractionWithStrokes:drawing:cancelled:forPreview:](self, "didEndLiveInteractionWithStrokes:drawing:cancelled:forPreview:", a3, a4, a5, 0);
}

- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5 forPreview:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  int64_t liveInteractionCount;
  int64_t v13;
  dispatch_block_t v15;
  id combineTimeoutBlock;
  dispatch_time_t v17;
  NSMutableArray *finishedStrokes;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  UITouch *currentStrokeTouch;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[4];
  id v46;
  id v47;
  id location[2];
  _BYTE v49[128];
  uint64_t v50;

  v6 = a6;
  v7 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  liveInteractionCount = self->_liveInteractionCount;
  v13 = liveInteractionCount - 1;
  self->_liveInteractionCount = liveInteractionCount - 1;
  if (self->_isCombiningStrokes && liveInteractionCount == 1)
  {
    self->_liveInteractionCount = liveInteractionCount;
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKTiledCanvasView_didEndLiveInteractionWithStrokes_drawing_cancelled_forPreview___block_invoke;
    block[3] = &unk_1E7777B58;
    objc_copyWeak(&v47, location);
    v46 = v11;
    v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
    combineTimeoutBlock = self->_combineTimeoutBlock;
    self->_combineTimeoutBlock = v15;

    v17 = dispatch_time(0, 1000000000);
    dispatch_after(v17, MEMORY[0x1E0C80D38], self->_combineTimeoutBlock);

    objc_destroyWeak(&v47);
    objc_destroyWeak(location);
    v13 = self->_liveInteractionCount;
  }
  if (v13)
  {
    if (v13 >= 1 && objc_msgSend(v10, "count") && !v7)
    {
      finishedStrokes = self->_finishedStrokes;
      if (!finishedStrokes)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
        v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v20 = self->_finishedStrokes;
        self->_finishedStrokes = v19;

        finishedStrokes = self->_finishedStrokes;
      }
      -[NSMutableArray addObjectsFromArray:](finishedStrokes, "addObjectsFromArray:", v10);
    }
  }
  else
  {
    v21 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEBUG, "Canvas live interaction will end", (uint8_t *)location, 2u);
    }

    v22 = (void *)MEMORY[0x1E0C9AA60];
    if (v10 && !v7)
      v22 = (void *)objc_msgSend(v10, "copy");
    if (-[NSMutableArray count](self->_finishedStrokes, "count"))
    {
      -[NSMutableArray addObjectsFromArray:](self->_finishedStrokes, "addObjectsFromArray:", v22);
      v23 = -[NSMutableArray copy](self->_finishedStrokes, "copy");

      v22 = (void *)v23;
      -[NSMutableArray removeAllObjects](self->_finishedStrokes, "removeAllObjects");
    }
    if ((*(_WORD *)&self->_canvasViewFlags & 0x800) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_canvasView:didFinishRenderingNewStrokes:inDrawing:forPreview:", self, v22, v11, v6);

    }
    currentStrokeTouch = self->_currentStrokeTouch;
    self->_currentStrokeTouch = 0;

    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v26 + 80));

    -[PKTiledCanvasView updateHasVisibleStrokes](self, "updateHasVisibleStrokes");
  }
  if (objc_msgSend(v10, "count") && v7 && (*(_WORD *)&self->_canvasViewFlags & 8) != 0 && !v6)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v10;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v42;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v28);
          v32 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v31);
          -[PKTiledCanvasView delegate](self, "delegate", (_QWORD)v41);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "canvasView:cancelledStroke:", self, v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController renderedStrokes](v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
    {
      -[PKTiledCanvasView drawing](self, "drawing");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "strokes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count") == 0;

      if (!v38)
        goto LABEL_41;
      -[PKTiledCanvasView _drawingController](self, "_drawingController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledCanvasView _drawingController](self, "_drawingController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKController renderedStrokes](v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v34, v39, 0);

    }
  }
LABEL_41:
  if (self->_liveInteractionCount < 0)
  {
    v40 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1BE213000, v40, OS_LOG_TYPE_FAULT, "Drawing count mismatch!", (uint8_t *)location, 2u);
    }

    self->_liveInteractionCount = 0;
  }

}

void __83__PKTiledCanvasView_didEndLiveInteractionWithStrokes_drawing_cancelled_forPreview___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[65];
    WeakRetained[65] = 0;

    *((_BYTE *)WeakRetained + 536) = 0;
    objc_msgSend(WeakRetained, "didEndLiveInteractionWithStrokes:drawing:cancelled:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32), 0);
  }

}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
  if (alternativeStrokesAnimation)
  {
    alternativeStrokesAnimation->_forceDone = 1;
    -[PKTiledCanvasView _drawingDisplay:](self, "_drawingDisplay:", 0.0);
  }
  -[PKTiledCanvasView ink](self, "ink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_isHandwritingInk");

  return v13 ^ 1;
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a4;
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x20) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "canvasView:shouldDelayDrawingBeganWithTouch:", self, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_inkForNewStroke
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (-[PKTiledCanvasView sixChannelBlending](self, "sixChannelBlending"))
    -[PKTiledCanvasView sixChannelInk](self, "sixChannelInk");
  else
    -[PKTiledCanvasView ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1BE213000, v4, OS_LOG_TYPE_FAULT, "Started a new stroke without an ink", v6, 2u);
    }

    v3 = (void *)objc_opt_new();
    -[PKTiledCanvasView setInk:](self, "setInk:", v3);
  }
  return v3;
}

- (void)drawingBegan:(id)a3
{
  UITouch *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  __int128 v12;

  v4 = (UITouch *)a3;
  LogTouchIfEnabled(v4, 0);
  -[PKTiledCanvasView _touchView](self, "_touchView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouch PK_preciseLocationInView:](v4, "PK_preciseLocationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = -[UITouch type](v4, "type") == UITouchTypePencil;
  -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", v4, &v12, 0, 0, objc_msgSend(v11, "activeInputProperties"), v10, v7, v9);

}

- (void)_drawingBegan:(id)a3 inputPoint:(id *)a4 locationInView:(CGPoint)a5 forPreview:(BOOL)a6 disableDetachedRendering:(BOOL)a7 activeInputProperties:(unint64_t)a8 inputType:(int64_t)a9
{
  void *v9;
  _BOOL4 v10;
  _BOOL8 v11;
  double y;
  double x;
  void *v16;
  $6AF91522889691011B0C2D3E90F36BFE *p_canvasViewFlags;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  _BYTE *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFTimeInterval *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BYTE *v55;
  BOOL v56;
  void *v57;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  void *v63;
  char v64;
  void *v65;
  _BOOL4 v66;
  PKDrawingPowerSavingController *v67;
  _BYTE *v68;
  void *v69;
  void *v70;
  char v71;
  char v72;
  _BYTE *v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void *v80;
  double v81;
  os_unfair_lock_s *v82;
  os_unfair_lock_s *v83;
  void *v84;
  id v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  uint64_t v96;
  void *v97;
  id v99;
  _OWORD v100[8];
  _QWORD v101[5];
  id v102;
  char v103;
  BOOL v104;
  __int128 v105[8];
  _QWORD v106[4];
  id v107;
  __int128 v108[3];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id location[2];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[8];
  _QWORD v121[4];
  id v122;
  uint8_t buf[4];
  void *v124;
  uint64_t v125;

  v95 = a8;
  v10 = a7;
  v11 = a6;
  y = a5.y;
  x = a5.x;
  v125 = *MEMORY[0x1E0C80C00];
  v99 = a3;
  std::vector<PKInputPoint>::resize((uint64_t)&self->_rollPointsToUpdate, 0);
  -[PKTiledCanvasView setupMetalViewIfNecessary](self, "setupMetalViewIfNecessary");
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIsPreviewing:", v11);

  p_canvasViewFlags = &self->_canvasViewFlags;
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 1) != 0
    && -[PKTiledCanvasView enableCanvasOffsetSupport](self, "enableCanvasOffsetSupport"))
  {
    -[PKTiledCanvasView metalView](self, "metalView");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      objc_msgSend(*(id *)(v18 + 424), "setPresentsWithTransaction:", 1);

    objc_initWeak(location, self);
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke;
    v121[3] = &unk_1E77782B0;
    objc_copyWeak(&v122, location);
    -[PKMetalRendererController setCanvasOffsetPresentationOffsetBlock:]((uint64_t)v20, v121);

    objc_destroyWeak(&v122);
    objc_destroyWeak(location);
  }
  else
  {
    -[PKTiledCanvasView metalView](self, "metalView", v95);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      objc_msgSend(*(id *)(v21 + 424), "setPresentsWithTransaction:", 0);

    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setCanvasOffsetPresentationOffsetBlock:]((uint64_t)v23, 0);

  }
  -[PKTiledCanvasView metalView](self, "metalView", v95);
  v24 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v24);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v25, "setAllowsDisplayCompositing:", !v10);

  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = v26 == 0;

  if ((v25 & 1) == 0)
  {
    v27 = -[PKTiledCanvasView _isShapeRecognitionEnabled](self, "_isShapeRecognitionEnabled");
    -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
    v28 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v28[185] = v27 && !v11;

  }
  -[PKTiledCanvasView cancelPurgeResourcesBlock](self, "cancelPurgeResourcesBlock");
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x200) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_OWORD *)&a4->var9;
    v120[4] = *(_OWORD *)&a4->var7;
    v120[5] = v30;
    v31 = *(_OWORD *)&a4->var13;
    v120[6] = *(_OWORD *)&a4->var11;
    v120[7] = v31;
    v32 = *(_OWORD *)&a4->var1;
    v120[0] = a4->var0;
    v120[1] = v32;
    v33 = *(_OWORD *)&a4->var5;
    v120[2] = *(_OWORD *)&a4->var3;
    v120[3] = v33;
    objc_msgSend(v29, "_canvasViewWillBeginDrawing:startPoint:forPreview:", self, v120, v11);
    goto LABEL_18;
  }
  if ((*(_WORD *)p_canvasViewFlags & 0x40) != 0 && !v11)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_canvasViewWillBeginDrawing:", self);
LABEL_18:

  }
  if (a9 == 1)
  {
    +[PKPencilDevice activePencil]();
    v34 = (CFTimeInterval *)objc_claimAutoreleasedReturnValue();
    if (v34)
      v34[2] = CACurrentMediaTime();

  }
  if (!v99 || !-[PKTiledCanvasView eraserBegan:](self, "eraserBegan:", v99))
  {
    -[PKTiledCanvasView ink](self, "ink");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "_isEraserInk") & 1) != 0)
      v36 = 1;
    else
      v36 = -[PKTiledCanvasView hasSnapshot](self, "hasSnapshot") ^ 1;
    -[PKTiledCanvasView _updateMetalLayerOpacityForceNonOpaqueSixChannel:](self, "_updateMetalLayerOpacityForceNonOpaqueSixChannel:", v36);

    if ((*(_WORD *)p_canvasViewFlags & 2) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "canvasViewWillBeginNewStroke:withTouch:location:", self, v99, x, y);

    }
    if (v99)
    {
      -[PKTiledCanvasView _touchView](self, "_touchView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "PK_preciseLocationInView:", v38);
      x = v39;
      y = v40;

      -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", x, y);
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v99, 0, v96);
      v41 = v117;
      *(_OWORD *)&a4->var7 = v116;
      *(_OWORD *)&a4->var9 = v41;
      v42 = v119;
      *(_OWORD *)&a4->var11 = v118;
      *(_OWORD *)&a4->var13 = v42;
      v43 = v113;
      a4->var0 = *($9076B28992D74D3AA2059476C2B9E2A9 *)location;
      *(_OWORD *)&a4->var1 = v43;
      v44 = v115;
      *(_OWORD *)&a4->var3 = v114;
      *(_OWORD *)&a4->var5 = v44;
    }
    v113 = 0u;
    v114 = 0u;
    *(_OWORD *)location = 0u;
    -[PKTiledCanvasView scaledStrokeTransform](self, "scaledStrokeTransform");
    v109 = *(_OWORD *)location;
    v110 = v113;
    v111 = v114;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v109;
    v108[1] = v110;
    v108[2] = v111;
    -[PKMetalRendererController setStrokeTransform:]((uint64_t)v45, v108);

    self->_inputScale = sqrt(*(double *)&location[1] * *(double *)&location[1] + *(double *)location
                                                                               * *(double *)location);
    kdebug_trace();
    kdebug_trace();
    v46 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v124 = v47;
      _os_log_impl(&dword_1BE213000, v46, OS_LOG_TYPE_DEFAULT, "Began drawing: %@", buf, 0xCu);

    }
    -[PKTiledCanvasView willBeginLiveInteractionWithTouch:](self, "willBeginLiveInteractionWithTouch:", v99);
    -[PKTiledCanvasView setIsDrawing:forPreview:](self, "setIsDrawing:forPreview:", 1, v11);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v48, "systemUptime");
    -[PKTiledCanvasView setDrawingStartTimestamp:](self, "setDrawingStartTimestamp:");

    -[PKTiledCanvasView _inputScale](self, "_inputScale");
    v50 = v49;
    -[PKTiledCanvasView activeDrawing](self, "activeDrawing");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)objc_msgSend(v51, "newStroke");

    -[PKTiledCanvasView _inkForNewStroke](self, "_inkForNewStroke");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "_setInk:", v52);

    if (-[PKTiledCanvasView generateLiveDrawing](self, "generateLiveDrawing"))
    {
      objc_initWeak((id *)buf, self);
      -[PKTiledCanvasView _drawingController](self, "_drawingController");
      v48 = objc_claimAutoreleasedReturnValue();
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_128;
      v106[3] = &unk_1E77782D8;
      objc_copyWeak(&v107, (id *)buf);
      -[PKController addLiveStrokeEarly:completionBlock:](v48, v97, v106);

      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);
    }
    if (self->_isCombiningStrokes)
      objc_msgSend(v97, "_setRenderGroupID:", self->_combineStrokesRenderGroupID);
    -[PKTiledCanvasView ink](self, "ink");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "_isStrokeGeneratingInk"))
    {
      -[PKTiledCanvasView ink](self, "ink");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v54, "_isHandwritingInk") & 1) != 0
        || (-[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController"),
            (v55 = (_BYTE *)objc_claimAutoreleasedReturnValue()) == 0))
      {

      }
      else
      {
        if (v55[184])
        {

        }
        else
        {
          v56 = v55[185] == 0;

          if (v56)
            goto LABEL_47;
        }
        -[PKTiledCanvasView _touchView](self, "_touchView");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledCanvasView _touchView](self, "_touchView");
        v48 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v48, "window");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "convertPoint:toView:", v58, x, y);
        v60 = v59;
        v62 = v61;

        -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShapeDrawingController beginStrokeAtPoint:]((uint64_t)v53, v60, v62);
      }
    }

LABEL_47:
    if (!a9)
    {
      -[PKTiledCanvasView traitCollection](self, "traitCollection");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v63, "forceTouchCapability") == 1;

      if ((_DWORD)v48)
        a4->var1 = -1.0;
    }
    if (!v11)
    {
      v64 = 1;
    }
    else if (os_variant_has_internal_diagnostics())
    {
      if (qword_1EF560410 != -1)
        dispatch_once(&qword_1EF560410, &__block_literal_global_823);
      if (byte_1EF560401)
        v64 = 1;
      else
        v64 = !v11;
    }
    else
    {
      v64 = 0;
    }
    -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65 == 0;

    if (v66)
    {
      v67 = objc_alloc_init(PKDrawingPowerSavingController);
      -[PKTiledCanvasView setPowerSavingController:](self, "setPowerSavingController:", v67);

    }
    -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
    v68 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v68)
      v68[104] = a9 == 1;

    objc_msgSend(v97, "ink");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "identifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "isEqual:", CFSTR("com.apple.ink.marker"));
    if ((v71 & 1) != 0)
    {
      v72 = 1;
    }
    else
    {
      objc_msgSend(v97, "ink");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v48 = objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend((id)v48, "isEqual:", CFSTR("com.apple.ink.eraser"));
    }
    -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
    v73 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v73)
      v73[105] = v72;

    if ((v71 & 1) == 0)
    {

    }
    -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      *(_BYTE *)(v74 + 72) = 0;
      *(double *)(v74 + 32) = x;
      *(double *)(v74 + 40) = y;
      *(_QWORD *)(v74 + 48) = 0;
      *(_QWORD *)(v74 + 56) = 0;
      *(_QWORD *)(v74 + 16) = *(_QWORD *)(v74 + 8);
    }

    -[PKTiledCanvasView _postBeganSketchingAXAnnouncement](self, "_postBeganSketchingAXAnnouncement");
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *(_OWORD *)&a4->var9;
    v105[4] = *(_OWORD *)&a4->var7;
    v105[5] = v76;
    v77 = *(_OWORD *)&a4->var13;
    v105[6] = *(_OWORD *)&a4->var11;
    v105[7] = v77;
    v78 = *(_OWORD *)&a4->var1;
    v105[0] = (__int128)a4->var0;
    v105[1] = v78;
    v79 = *(_OWORD *)&a4->var5;
    v105[2] = *(_OWORD *)&a4->var3;
    v105[3] = v79;
    -[PKMetalRendererController addInputPoint:]((uint64_t)v75, v105);

    +[PKPencilDevice activePencil]();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[PKPencilDevice baseRollAngle]((uint64_t)v80);
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v82 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v82)
    {
      os_unfair_lock_lock(v82 + 76);
      *(double *)&v83[90]._os_unfair_lock_opaque = v81;
      os_unfair_lock_unlock(v83 + 76);
    }

    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_3;
    v101[3] = &unk_1E7778300;
    v101[4] = self;
    v85 = v97;
    v102 = v85;
    v103 = v64;
    v104 = v11;
    objc_msgSend(v84, "drawingBeganWithStroke:inputType:activeInputProperties:inputScale:start:", v85, a9, v96, v101, v50);

    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = *(_OWORD *)&a4->var9;
    v100[4] = *(_OWORD *)&a4->var7;
    v100[5] = v87;
    v88 = *(_OWORD *)&a4->var13;
    v100[6] = *(_OWORD *)&a4->var11;
    v100[7] = v88;
    v89 = *(_OWORD *)&a4->var1;
    v100[0] = a4->var0;
    v100[1] = v89;
    v90 = *(_OWORD *)&a4->var5;
    v100[2] = *(_OWORD *)&a4->var3;
    v100[3] = v90;
    objc_msgSend(v86, "addPoint:", v100);

    -[PKTiledCanvasView metalView](self, "metalView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalView setDoubleBuffered:]((uint64_t)v91, 1);

    self->_numSkippedDoubleBufferedFrames = 0;
    -[PKTiledCanvasView rulerController](self, "rulerController");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v86) = -[PKRulerController rulerSelected]((uint64_t)v92);

    if ((_DWORD)v86)
    {
      -[PKTiledCanvasView rulerController](self, "rulerController");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledCanvasView _touchView](self, "_touchView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRulerController drawingBegan:coordinateSystem:]((uint64_t)v93, v94, x, y);

    }
    kdebug_trace();

  }
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canvasView:didPresentWithCanvasOffset:", v7, a2, a3);

    WeakRetained = v7;
  }

}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_128(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = (void *)objc_msgSend(a2, "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_2;
  v5[3] = &unk_1E7777B58;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeWithDrawing:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "setDrawing:", v8);
  }

}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "_drawingController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(void **)(v2 + 64);
  else
    v4 = 0;
  v5 = v4;
  -[PKMetalRendererController drawingBeganWithStroke:forPreview:]((uint64_t)v5, *(void **)(a1 + 40), *(_BYTE *)(a1 + 48) == 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_4;
  block[3] = &unk_1E7778560;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 49);
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_4(uint64_t a1)
{
  _WORD *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_startDisplayLinkShouldPause:", 0);
  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = *(_WORD **)(a1 + 32);
    if ((v2[228] & 4) != 0)
    {
      objc_msgSend(v2, "delegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "canvasView:beganStroke:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)_notifyEraserMoved:(id)a3 location:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  y = a4.y;
  x = a4.x;
  v19 = a3;
  if ((*(_WORD *)&self->_canvasViewFlags & 0x4000) != 0)
  {
    -[PKTiledCanvasView selectionController](self, "selectionController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 112));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "liveAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v19)
      {
        -[PKTiledCanvasView _touchView](self, "_touchView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "PK_preciseLocationInView:", v11);
        v13 = v12;
        v15 = v14;

        -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v13, v15);
        x = v16;
        y = v17;
      }
      -[PKTiledCanvasView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_canvasView:eraserMoved:attachment:", self, v10, x, y);

    }
  }

}

- (void)drawingMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  CFTimeInterval *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_rollPointsToUpdate;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v63;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD *v72;
  BOOL v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  void *v79;
  uint64_t v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  UITouch *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  _OWORD *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _OWORD *v112;
  _OWORD *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  char *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  char *v133;
  _QWORD *v134;
  BOOL v135;
  void *v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i;
  void *v146;
  void *v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  _OWORD *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _OWORD *v164;
  _OWORD *v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  char *v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  char *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  char *v185;
  void *v186;
  void *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  void *v192;
  void *v193;
  id v194;
  uint64_t v195;
  id v196;
  __int128 v197[8];
  void *v198;
  void *v199;
  uint64_t v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _OWORD v205[8];
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  void *__p;
  _OWORD *v211;
  unint64_t v212;
  _OWORD v213[8];
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  uint64_t v229;

  v229 = *MEMORY[0x1E0C80C00];
  v196 = a3;
  v194 = a4;
  -[PKTiledCanvasView ink](self, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isEraserInk");

  v8 = v7 ^ 1;
  if (!v196)
    v8 = 1;
  if ((v8 & 1) == 0)
    -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", v196, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (self->_isErasingObjects)
  {
    -[PKTiledCanvasView eraserMoved:](self, "eraserMoved:", v196);
    goto LABEL_128;
  }
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "inputType");

  if (v10 == 1)
  {
    +[PKPencilDevice activePencil]();
    v11 = (CFTimeInterval *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v11[2] = CACurrentMediaTime();

  }
  -[PKTiledCanvasView rulerController](self, "rulerController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKRulerController rulerSelected]((uint64_t)v12);

  v14 = v13 ^ 1;
  if (!v196)
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    -[PKTiledCanvasView _touchView](self, "_touchView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "PK_preciseLocationInView:", v15);
    v17 = v16;
    v19 = v18;

    -[PKTiledCanvasView rulerController](self, "rulerController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _touchView](self, "_touchView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerController drawingMoved:coordinateSystem:]((uint64_t)v20, v21, v17, v19);

  }
  if (qword_1EF560418 != -1)
    dispatch_once(&qword_1EF560418, &__block_literal_global_826);
  if (byte_1EF560402)
  {
    v224 = 0u;
    v225 = 0u;
    v222 = 0u;
    v223 = 0u;
    objc_msgSend(v194, "coalescedTouchesForTouch:", v196);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v222, v228, 16);
    if (!v23)
      goto LABEL_127;
    v24 = *(_QWORD *)v223;
    while (1)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v223 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * v25);
        objc_msgSend(v26, "estimationUpdateIndex");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (objc_msgSend(v26, "estimatedPropertiesExpectingUpdates") & 0x10) == 0;

          if (!v28)
          {
            -[PKTiledCanvasView _touchView](self, "_touchView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "PK_preciseLocationInView:", v29);
            v31 = v30;
            v33 = v32;

            -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
            v34 = (double *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = v34[6] + sqrt((v34[5] - v33) * (v34[5] - v33) + (v34[4] - v31) * (v34[4] - v31));
              v34[5] = v33;
              v34[6] = v35;
              v34[4] = v31;
            }

            -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v31, v33);
            v37 = v36;
            v39 = v38;
            v220 = 0u;
            v221 = 0u;
            v218 = 0u;
            v219 = 0u;
            v216 = 0u;
            v217 = 0u;
            v214 = 0u;
            v215 = 0u;
            -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v26, 0, objc_msgSend(v40, "activeInputProperties"), v37, v39);

            p_rollPointsToUpdate = &self->_rollPointsToUpdate;
            end = self->_rollPointsToUpdate.__end_;
            value = self->_rollPointsToUpdate.__end_cap_.__value_;
            if (end >= value)
            {
              v51 = (end - p_rollPointsToUpdate->__begin_) >> 7;
              v52 = v51 + 1;
              if ((unint64_t)(v51 + 1) >> 57)
                std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
              v53 = value - p_rollPointsToUpdate->__begin_;
              if (v53 >> 6 > v52)
                v52 = v53 >> 6;
              if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFF80)
                v54 = 0x1FFFFFFFFFFFFFFLL;
              else
                v54 = v52;
              if (v54)
                v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_rollPointsToUpdate.__end_cap_, v54);
              else
                v55 = 0;
              v56 = &v55[128 * v51];
              v57 = v214;
              v58 = v215;
              v59 = v217;
              *((_OWORD *)v56 + 2) = v216;
              *((_OWORD *)v56 + 3) = v59;
              *(_OWORD *)v56 = v57;
              *((_OWORD *)v56 + 1) = v58;
              v60 = v218;
              v61 = v219;
              v62 = v221;
              *((_OWORD *)v56 + 6) = v220;
              *((_OWORD *)v56 + 7) = v62;
              *((_OWORD *)v56 + 4) = v60;
              *((_OWORD *)v56 + 5) = v61;
              begin = p_rollPointsToUpdate->__begin_;
              v63 = self->_rollPointsToUpdate.__end_;
              v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v56;
              if (v63 != p_rollPointsToUpdate->__begin_)
              {
                do
                {
                  v66 = *((_OWORD *)v63 - 8);
                  v67 = *((_OWORD *)v63 - 7);
                  v68 = *((_OWORD *)v63 - 5);
                  *((_OWORD *)v65 - 6) = *((_OWORD *)v63 - 6);
                  *((_OWORD *)v65 - 5) = v68;
                  *((_OWORD *)v65 - 8) = v66;
                  *((_OWORD *)v65 - 7) = v67;
                  v69 = *((_OWORD *)v63 - 4);
                  v70 = *((_OWORD *)v63 - 3);
                  v71 = *((_OWORD *)v63 - 1);
                  *((_OWORD *)v65 - 2) = *((_OWORD *)v63 - 2);
                  *((_OWORD *)v65 - 1) = v71;
                  *((_OWORD *)v65 - 4) = v69;
                  *((_OWORD *)v65 - 3) = v70;
                  v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v65 - 128);
                  v63 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v63 - 128);
                }
                while (v63 != begin);
                v63 = p_rollPointsToUpdate->__begin_;
              }
              v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v56 + 128);
              p_rollPointsToUpdate->__begin_ = v65;
              self->_rollPointsToUpdate.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v56 + 128);
              self->_rollPointsToUpdate.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v55[128 * v54];
              if (v63)
                operator delete(v63);
            }
            else
            {
              v44 = v214;
              v45 = v215;
              v46 = v217;
              *((_OWORD *)end + 2) = v216;
              *((_OWORD *)end + 3) = v46;
              *(_OWORD *)end = v44;
              *((_OWORD *)end + 1) = v45;
              v47 = v218;
              v48 = v219;
              v49 = v221;
              *((_OWORD *)end + 6) = v220;
              *((_OWORD *)end + 7) = v49;
              *((_OWORD *)end + 4) = v47;
              *((_OWORD *)end + 5) = v48;
              v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
            }
            self->_rollPointsToUpdate.__end_ = v50;
            -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
            v72 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            if (v72)
            {
              v73 = v72[2] == v72[1];

              if (v73)
                goto LABEL_47;
              -[PKTiledCanvasView window](self, "window");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v196, "locationInView:", v74);
              v76 = v75;
              v78 = v77;

              -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v213[4] = v218;
              v213[5] = v219;
              v213[6] = v220;
              v213[7] = v221;
              v213[0] = v214;
              v213[1] = v215;
              v213[2] = v216;
              v213[3] = v217;
              -[PKShapeDrawingController addStrokePoint:inputPoint:]((uint64_t)v79, v213, v76, v78);
            }
            else
            {
              v79 = 0;
            }

          }
        }
LABEL_47:
        ++v25;
      }
      while (v25 != v23);
      v80 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v222, v228, 16);
      v23 = v80;
      if (!v80)
        goto LABEL_127;
    }
  }
  objc_msgSend(v196, "timestamp");
  kdebug_trace();
  objc_msgSend(v194, "coalescedTouchesForTouch:", v196);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "count");

  if (self->_maxNumPredictionPoints && !-[PKTiledCanvasView predictionDisabled](self, "predictionDisabled"))
  {
    objc_msgSend(v194, "predictedTouchesForTouch:", v196);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (self->_maxNumPredictionPoints < 1
      || (unint64_t)objc_msgSend(v83, "count") <= self->_maxNumPredictionPoints)
    {
      v86 = v84;
    }
    else
    {
      objc_msgSend(v84, "subarrayWithRange:", 0);
      v85 = objc_claimAutoreleasedReturnValue();

      v86 = (void *)v85;
    }
    v193 = v86;
    v82 += objc_msgSend(v86, "count");
  }
  else
  {
    v193 = 0;
  }
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v82);
  __p = 0;
  v211 = 0;
  v212 = 0;
  std::vector<PKInputPoint>::reserve(&__p, v82);
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  objc_msgSend(v194, "coalescedTouchesForTouch:", v196);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v206, v227, 16);
  if (!v89)
    goto LABEL_93;
  v90 = *(_QWORD *)v207;
  v195 = 0;
  do
  {
    v91 = 0;
    v195 += v89;
    do
    {
      if (*(_QWORD *)v207 != v90)
        objc_enumerationMutation(v88);
      v92 = *(UITouch **)(*((_QWORD *)&v206 + 1) + 8 * v91);
      LogTouchIfEnabled(v92, 0);
      -[PKTiledCanvasView _touchView](self, "_touchView");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITouch PK_preciseLocationInView:](v92, "PK_preciseLocationInView:", v93);
      v95 = v94;
      v97 = v96;

      -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
      v98 = (double *)objc_claimAutoreleasedReturnValue();
      if (v98)
      {
        v99 = v98[6] + sqrt((v98[5] - v97) * (v98[5] - v97) + (v98[4] - v95) * (v98[4] - v95));
        v98[5] = v97;
        v98[6] = v99;
        v98[4] = v95;
      }

      -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v95, v97);
      v101 = v100;
      v103 = v102;
      v220 = 0u;
      v221 = 0u;
      v218 = 0u;
      v219 = 0u;
      v216 = 0u;
      v217 = 0u;
      v214 = 0u;
      v215 = 0u;
      -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v92, 0, objc_msgSend(v104, "activeInputProperties"), v101, v103);

      v105 = v211;
      if ((unint64_t)v211 >= v212)
      {
        v113 = __p;
        v114 = ((char *)v211 - (_BYTE *)__p) >> 7;
        v115 = v114 + 1;
        if ((unint64_t)(v114 + 1) >> 57)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v116 = v212 - (_QWORD)__p;
        if ((uint64_t)(v212 - (_QWORD)__p) >> 6 > v115)
          v115 = v116 >> 6;
        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFF80)
          v117 = 0x1FFFFFFFFFFFFFFLL;
        else
          v117 = v115;
        if (v117)
        {
          v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v212, v117);
          v113 = __p;
          v105 = v211;
        }
        else
        {
          v118 = 0;
        }
        v119 = &v118[128 * v114];
        v120 = v214;
        v121 = v215;
        v122 = v217;
        *((_OWORD *)v119 + 2) = v216;
        *((_OWORD *)v119 + 3) = v122;
        *(_OWORD *)v119 = v120;
        *((_OWORD *)v119 + 1) = v121;
        v123 = v218;
        v124 = v219;
        v125 = v221;
        *((_OWORD *)v119 + 6) = v220;
        *((_OWORD *)v119 + 7) = v125;
        *((_OWORD *)v119 + 4) = v123;
        *((_OWORD *)v119 + 5) = v124;
        if (v105 == v113)
        {
          v133 = &v118[128 * v114];
        }
        else
        {
          v126 = &v118[128 * v114];
          do
          {
            v127 = *(v105 - 8);
            v128 = *(v105 - 7);
            v129 = *(v105 - 5);
            *((_OWORD *)v126 - 6) = *(v105 - 6);
            *((_OWORD *)v126 - 5) = v129;
            *((_OWORD *)v126 - 8) = v127;
            *((_OWORD *)v126 - 7) = v128;
            v130 = *(v105 - 4);
            v131 = *(v105 - 3);
            v132 = *(v105 - 1);
            v133 = v126 - 128;
            *((_OWORD *)v126 - 2) = *(v105 - 2);
            *((_OWORD *)v126 - 1) = v132;
            *((_OWORD *)v126 - 4) = v130;
            *((_OWORD *)v126 - 3) = v131;
            v105 -= 8;
            v126 -= 128;
          }
          while (v105 != v113);
        }
        v112 = v119 + 128;
        __p = v133;
        v211 = v119 + 128;
        v212 = (unint64_t)&v118[128 * v117];
        if (v113)
          operator delete(v113);
      }
      else
      {
        v106 = v214;
        v107 = v215;
        v108 = v217;
        v211[2] = v216;
        v105[3] = v108;
        *v105 = v106;
        v105[1] = v107;
        v109 = v218;
        v110 = v219;
        v111 = v221;
        v105[6] = v220;
        v105[7] = v111;
        v105[4] = v109;
        v105[5] = v110;
        v112 = v105 + 8;
      }
      v211 = v112;
      objc_msgSend(v87, "addObject:", v92);
      -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
      v134 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v134)
      {
        v135 = v134[2] == v134[1];

        if (v135)
          goto LABEL_89;
        -[PKTiledCanvasView window](self, "window");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "locationInView:", v136);
        v138 = v137;
        v140 = v139;

        -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v205[4] = v218;
        v205[5] = v219;
        v205[6] = v220;
        v205[7] = v221;
        v205[0] = v214;
        v205[1] = v215;
        v205[2] = v216;
        v205[3] = v217;
        -[PKShapeDrawingController addStrokePoint:inputPoint:]((uint64_t)v141, v205, v138, v140);
      }
      else
      {
        v141 = 0;
      }

LABEL_89:
      ++v91;
    }
    while (v91 != v89);
    v142 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v206, v227, 16);
    v89 = v142;
  }
  while (v142);
LABEL_93:

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v22 = v193;
  v143 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
  if (v143)
  {
    v144 = *(_QWORD *)v202;
    do
    {
      for (i = 0; i != v143; ++i)
      {
        if (*(_QWORD *)v202 != v144)
          objc_enumerationMutation(v22);
        v146 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
        -[PKTiledCanvasView _touchView](self, "_touchView");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "PK_preciseLocationInView:", v147);
        v149 = v148;
        v151 = v150;

        -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v149, v151);
        v153 = v152;
        v155 = v154;
        v220 = 0u;
        v221 = 0u;
        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        v214 = 0u;
        v215 = 0u;
        -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v146, 1, objc_msgSend(v156, "activeInputProperties"), v153, v155);

        v157 = v211;
        if ((unint64_t)v211 >= v212)
        {
          v165 = __p;
          v166 = ((char *)v211 - (_BYTE *)__p) >> 7;
          v167 = v166 + 1;
          if ((unint64_t)(v166 + 1) >> 57)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v168 = v212 - (_QWORD)__p;
          if ((uint64_t)(v212 - (_QWORD)__p) >> 6 > v167)
            v167 = v168 >> 6;
          if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFF80)
            v169 = 0x1FFFFFFFFFFFFFFLL;
          else
            v169 = v167;
          if (v169)
          {
            v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v212, v169);
            v165 = __p;
            v157 = v211;
          }
          else
          {
            v170 = 0;
          }
          v171 = &v170[128 * v166];
          v172 = v214;
          v173 = v215;
          v174 = v217;
          *((_OWORD *)v171 + 2) = v216;
          *((_OWORD *)v171 + 3) = v174;
          *(_OWORD *)v171 = v172;
          *((_OWORD *)v171 + 1) = v173;
          v175 = v218;
          v176 = v219;
          v177 = v221;
          *((_OWORD *)v171 + 6) = v220;
          *((_OWORD *)v171 + 7) = v177;
          *((_OWORD *)v171 + 4) = v175;
          *((_OWORD *)v171 + 5) = v176;
          if (v157 == v165)
          {
            v185 = &v170[128 * v166];
          }
          else
          {
            v178 = &v170[128 * v166];
            do
            {
              v179 = *(v157 - 8);
              v180 = *(v157 - 7);
              v181 = *(v157 - 5);
              *((_OWORD *)v178 - 6) = *(v157 - 6);
              *((_OWORD *)v178 - 5) = v181;
              *((_OWORD *)v178 - 8) = v179;
              *((_OWORD *)v178 - 7) = v180;
              v182 = *(v157 - 4);
              v183 = *(v157 - 3);
              v184 = *(v157 - 1);
              v185 = v178 - 128;
              *((_OWORD *)v178 - 2) = *(v157 - 2);
              *((_OWORD *)v178 - 1) = v184;
              *((_OWORD *)v178 - 4) = v182;
              *((_OWORD *)v178 - 3) = v183;
              v157 -= 8;
              v178 -= 128;
            }
            while (v157 != v165);
          }
          v164 = v171 + 128;
          __p = v185;
          v211 = v171 + 128;
          v212 = (unint64_t)&v170[128 * v169];
          if (v165)
            operator delete(v165);
        }
        else
        {
          v158 = v214;
          v159 = v215;
          v160 = v217;
          v211[2] = v216;
          v157[3] = v160;
          *v157 = v158;
          v157[1] = v159;
          v161 = v218;
          v162 = v219;
          v163 = v221;
          v157[6] = v220;
          v157[7] = v163;
          v157[4] = v161;
          v157[5] = v162;
          v164 = v157 + 8;
        }
        v211 = v164;
        objc_msgSend(v87, "addObject:", v146);
      }
      v143 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
    }
    while (v143);
  }

  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = 0;
  v199 = 0;
  v200 = 0;
  std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&v198, __p, (uint64_t)v211, ((char *)v211 - (_BYTE *)__p) >> 7);
  objc_msgSend(v186, "addPoints:", &v198);
  if (v198)
  {
    v199 = v198;
    operator delete(v198);
  }

  if (v211 != __p)
  {
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = *(v211 - 3);
    v197[4] = *(v211 - 4);
    v197[5] = v188;
    v189 = *(v211 - 1);
    v197[6] = *(v211 - 2);
    v197[7] = v189;
    v190 = *(v211 - 7);
    v197[0] = *(v211 - 8);
    v197[1] = v190;
    v191 = *(v211 - 5);
    v197[2] = *(v211 - 6);
    v197[3] = v191;
    -[PKMetalRendererController addInputPoint:]((uint64_t)v187, v197);

  }
  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "canvasViewDrawingMoved:withTouch:", self, v196);

  }
  objc_msgSend(v196, "timestamp");
  objc_msgSend(v22, "count");
  kdebug_trace();
  if (__p)
  {
    v211 = __p;
    operator delete(__p);
  }

LABEL_127:
LABEL_128:

}

- (void)drawingEstimatedPropertiesUpdated:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  UITouch *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_rollPointsToUpdate;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  _OWORD v41[8];
  _OWORD v42[5];
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  kdebug_trace();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v4 = v40;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v63;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v63 != v6)
          objc_enumerationMutation(v4);
        v8 = *(UITouch **)(*((_QWORD *)&v62 + 1) + 8 * v7);
        if (v8 == self->_currentStrokeTouch)
        {
          LogTouchIfEnabled(*(UITouch **)(*((_QWORD *)&v62 + 1) + 8 * v7), 1);
          -[PKTiledCanvasView _touchView](self, "_touchView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITouch PK_preciseLocationInView:](v8, "PK_preciseLocationInView:", v9);
          v11 = v10;
          v13 = v12;

          -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v11, v13);
          v15 = v14;
          v17 = v16;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v8, 0, objc_msgSend(v18, "activeInputProperties"), v15, v17);

          if (qword_1EF560418 != -1)
            dispatch_once(&qword_1EF560418, &__block_literal_global_826);
          if (byte_1EF560402)
          {
            -[UITouch estimationUpdateIndex](v8, "estimationUpdateIndex");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (-[UITouch estimatedProperties](v8, "estimatedProperties") & 0x10) == 0;

              if (v21)
              {
                -[UITouch estimationUpdateIndex](v8, "estimationUpdateIndex");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "integerValue");

                p_rollPointsToUpdate = &self->_rollPointsToUpdate;
                begin = self->_rollPointsToUpdate.__begin_;
                v26 = self->_rollPointsToUpdate.__end_ - begin;
                if (v26 >= 1)
                {
                  v27 = 0;
                  v28 = (unint64_t)v26 >> 7;
                  if (v28 <= 1)
                    v28 = 1;
                  while (1)
                  {
                    v29 = (__int128 *)((char *)begin + v27);
                    if (*(_QWORD *)((char *)begin + v27 + 80) == v23)
                      break;
                    v27 += 128;
                    if (!--v28)
                      goto LABEL_26;
                  }
                  v30 = v29[3];
                  v51 = v29[2];
                  v52 = v30;
                  v53 = v29[4];
                  v31 = v29[1];
                  v49 = *v29;
                  v50 = v31;
                  v48 = *(__int128 *)((char *)v29 + 88);
                  -[UITouch PK_rollAngle](v8, "PK_rollAngle");
                  v33 = v32;
                  end = self->_rollPointsToUpdate.__end_;
                  v35 = (char *)p_rollPointsToUpdate->__begin_ + v27;
                  v36 = end - p_rollPointsToUpdate->__begin_ - v27;
                  v37 = v36 - 128;
                  if (v35 + 128 != (char *)end)
                    memmove(v35, v35 + 128, v36 - 128);
                  self->_rollPointsToUpdate.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v35[v37 & 0xFFFFFFFFFFFFFF80];
                  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v42[2] = v51;
                  v42[3] = v52;
                  v42[4] = v53;
                  v42[0] = v49;
                  v42[1] = v50;
                  v43 = -1;
                  v44 = v48;
                  v45 = v33;
                  v46 = 0;
                  v47 = 0;
                  objc_msgSend(v38, "addPoint:", v42);

                  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
                  {
                    -[PKTiledCanvasView delegate](self, "delegate");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "canvasViewDrawingMoved:withTouch:", self, v8);

                  }
                }
              }
            }
            goto LABEL_26;
          }
          -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v41[4] = v58;
          v41[5] = v59;
          v41[6] = v60;
          v41[7] = v61;
          v41[0] = v54;
          v41[1] = v55;
          v41[2] = v56;
          v41[3] = v57;
          objc_msgSend(v19, "drawingUpdatePoint:", v41);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_26:

}

- (void)_handleEndOfStroke:(id)a3 shapeStrokes:(id)a4 groupedUndoCommands:(id)a5 invalidateTiles:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__PKTiledCanvasView__handleEndOfStroke_shapeStrokes_groupedUndoCommands_invalidateTiles___block_invoke;
  v16[3] = &unk_1E7778328;
  objc_copyWeak(&v20, &location);
  v21 = a6;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __89__PKTiledCanvasView__handleEndOfStroke_shapeStrokes_groupedUndoCommands_invalidateTiles___block_invoke(uint64_t a1)
{
  _WORD *WeakRetained;
  void *v3;
  _WORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained + 228;
    v9 = WeakRetained;
    if ((__int16)WeakRetained[228] < 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      v3 = v9;
      if (v5)
      {
        objc_msgSend(v9, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "canvasView:registerMultiStepUndoCommands:", v9, *(_QWORD *)(a1 + 32));

        v3 = v9;
      }
    }
    if (*(_BYTE *)(a1 + 64) && (v4[8] & 2) != 0)
    {
      objc_msgSend(v3, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "canvasViewInvalidateTiles:", v9);

      v3 = v9;
    }
    if (*(_QWORD *)(a1 + 40))
    {
      if ((*v4 & 0x20) != 0)
      {
        objc_msgSend(v3, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "canvasView:endedStroke:shapeStrokes:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        goto LABEL_13;
      }
      if ((*v4 & 0x10) != 0)
      {
        objc_msgSend(v3, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "canvasView:endedStroke:", v9, *(_QWORD *)(a1 + 40));
LABEL_13:

        v3 = v9;
      }
    }
  }

}

- (void)drawingGestureRecognizer:(id)a3 touchesEndedWithDrawingTouch:(id)a4
{
  _BYTE *v4;

  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController", a3, a4);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[67] = 0;

}

- (void)drawingEnded:(id)a3
{
  -[PKTiledCanvasView _drawingEnded:estimatesTimeout:completion:](self, "_drawingEnded:estimatesTimeout:completion:", a3, 0, 0.1);
}

- (void)_drawingEnded:(id)a3 estimatesTimeout:(double)a4 completion:(id)a5
{
  id v8;
  double *v9;
  double v10;
  NSObject *v11;
  void *v12;
  _BYTE *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PKShape *v17;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  PKAlternativeStrokesAnimation *v19;
  BOOL v20;
  double v21;
  PKAlternativeStrokesAnimation *v22;
  PKShape *shape;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id WeakRetained;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  PKTiledCanvasView *v59;
  PKShape *v60;
  id v61;
  id v62;
  double v63;
  char v64;
  char v65;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v56 = a5;
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v9 = (double *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v9[41] - v9[40];
  else
    v10 = 0.0;

  if (self->_isCombiningStrokes)
    ++self->_combiningStrokesCount;
  v11 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v12;
    _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Ended drawing: %@", buf, 0xCu);

  }
  -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
  v13 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v13[72] = 0;

  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = *(void **)(v14 + 200);
  else
    v16 = 0;
  v17 = v16;

  if (!v17)
  {
    alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
      alternativeStrokesAnimation = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_shape;
    v19 = alternativeStrokesAnimation;
    v20 = v19 == 0;

    if (v20
      || (v21 = CACurrentMediaTime(),
          v22 = self->_alternativeStrokesAnimation,
          -[PKAlternativeStrokesAnimation alphaAtTime:]((uint64_t)v22, v21) <= 0.01))
    {
      v17 = 0;
    }
    else
    {
      if (v22)
        shape = v22->_shape;
      else
        shape = 0;
      v17 = shape;
    }
  }
  if (-[PKTiledCanvasView isScratchOutPending](self, "isScratchOutPending"))
  {
    if (-[PKShape type](v17, "type") == 13)
      -[PKTiledCanvasView _didFinishErasingStrokes:](self, "_didFinishErasingStrokes:", 1);
    else
      -[PKTiledCanvasView clearHiddenStrokes](self, "clearHiddenStrokes");
    -[PKTiledCanvasView setIsScratchOutPending:](self, "setIsScratchOutPending:", 0);
  }
  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController resetStroke]((uint64_t)v24);

  -[PKTiledCanvasView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", v17 != 0);
  if (v8 && self->_isErasingObjects)
  {
    -[PKTiledCanvasView eraserEnded:](self, "eraserEnded:", v8);
    -[PKTiledCanvasView _callOptionalDrawingEndedCompletion:withStroke:shapeStrokes:](self, "_callOptionalDrawingEndedCompletion:withStroke:shapeStrokes:", v56, 0, 0);
  }
  else
  {
    -[PKTiledCanvasView rulerController](self, "rulerController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKRulerController rulerSelected]((uint64_t)v25);

    if (v26)
    {
      -[PKTiledCanvasView rulerController](self, "rulerController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRulerController drawingEnded]((uint64_t)v27);

    }
    -[PKTiledCanvasView setIsDrawing:](self, "setIsDrawing:", 0);
    if (v8)
    {
      objc_msgSend(v8, "timestamp");
      kdebug_trace();
    }
    -[PKTiledCanvasView drawing](self, "drawing");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v28 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v28;
    if (!v28)
      -[PKTiledCanvasView _callOptionalDrawingEndedCompletion:withStroke:shapeStrokes:](self, "_callOptionalDrawingEndedCompletion:withStroke:shapeStrokes:", v56, 0, 0);
    if (qword_1EF560420 != -1)
      dispatch_once(&qword_1EF560420, &__block_literal_global_829);
    v29 = MEMORY[0x1E0C809B0];
    if (byte_1EF560403 || -[PKShape type](v17, "type") == 13)
    {
      v30 = v29;
      v31 = 1;
    }
    else
    {
      v30 = v29;
      if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x100) != 0)
      {
        aBlock[0] = v29;
        aBlock[1] = 3221225472;
        aBlock[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke;
        aBlock[3] = &unk_1E7778350;
        aBlock[4] = v28;
        v52 = _Block_copy(aBlock);
        -[PKTiledCanvasView delegate](self, "delegate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v53, "canvasView:shouldDiscardEndedStroke:drawing:", self, v52, v54);

      }
      else
      {
        v31 = 0;
      }
    }
    v32 = objc_opt_class();
    -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      v35 = v31;
    else
      v35 = 1;
    if ((v35 & 1) == 0)
    {
      if ((objc_msgSend(v34, "isReplaying") & 1) != 0)
      {
        v31 = 0;
      }
      else
      {
        v36 = CACurrentMediaTime();
        objc_msgSend(v34, "startTimeInterval");
        v38 = v37;
        objc_msgSend(v34, "currentBoundingBoxInWindow");
        v40 = v39 <= 7.0;
        if (v41 > 7.0)
          v40 = 0;
        v42 = v36 - v38 <= 0.15 && v40;
        -[PKTiledCanvasView window](self, "window");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "windowScene");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          v31 = objc_msgSend(v45, "_tiledCanvasViewShouldDiscardTapStroke:", self);
        else
          v31 = 0;

      }
    }
    -[PKTiledCanvasView selectionController](self, "selectionController");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    if (v46)
      WeakRetained = objc_loadWeakRetained((id *)(v46 + 112));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "liveAttachment");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isSharedViaICloud");

    v57[0] = v30;
    v57[1] = 3221225472;
    v57[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2;
    v57[3] = &unk_1E77783F0;
    v63 = v10;
    v58 = v8;
    v59 = self;
    v60 = v17;
    v64 = v50;
    v65 = v31;
    v51 = v54;
    v61 = v51;
    v62 = v56;
    objc_msgSend(v55, "drawingEndedEstimatesTimeout:completion:", v57, a4);
    kdebug_trace();
    kdebug_trace();

  }
}

id __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newStrokeWithCurrentData");
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _WORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _WORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  _BYTE *v36;
  _BOOL4 v37;
  NSObject *v38;
  char v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD block[5];
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  char v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CGAffineTransform v83;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v86;
  CGAffineTransform v87;
  CGAffineTransform location;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEraser"))
  {
    v6 = *(_QWORD *)(a1 + 32);

    if (!v6)
      goto LABEL_6;
    +[PKStatisticsManager sharedStatisticsManager]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordBitmapEraseWithInputType:]((uint64_t)v4, objc_msgSend(*(id *)(a1 + 32), "type"));
  }
  else
  {

  }
LABEL_6:
  objc_msgSend(v3, "ink");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordStrokeWithInk:rollAngleDelta:]((uint64_t)v7, v53, *(double *)(a1 + 72));

  }
  if (v3)
  {
    v8 = *(_WORD **)(a1 + 40);
    if ((v8[236] & 8) != 0)
    {
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "canvasView:inkForStroke:", *(_QWORD *)(a1 + 40), v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "ink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        v12 = (void *)objc_msgSend(v3, "mutableCopy");
        objc_msgSend(v12, "setInk:", v10);
        v13 = objc_msgSend(v12, "copy");

        v3 = (id)v13;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "strokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = *(_WORD **)(a1 + 40);
    if ((v15[236] & 0x10) != 0)
    {
      memset(&location, 0, sizeof(location));
      objc_msgSend(v15, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v54 = v14;
      if (v17)
        objc_msgSend(v17, "canvasView:transformForStroke:", *(_QWORD *)(a1 + 40), v3);
      else
        memset(&location, 0, sizeof(location));

      v87 = location;
      if (CGAffineTransformIsIdentity(&v87))
      {
        v16 = v3;
      }
      else
      {
        v52 = (void *)objc_msgSend(v3, "mutableCopy");
        objc_msgSend(v3, "transform");
        t2 = location;
        CGAffineTransformConcat(&v86, &t1, &t2);
        v83 = v86;
        objc_msgSend(v52, "_setTransform:", &v83);
        v16 = (void *)objc_msgSend(v52, "copy");

        v19 = v52;
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v21 = v14;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v80;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v80 != v23)
                  objc_enumerationMutation(v21);
                v25 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                v26 = (void *)objc_msgSend(v25, "mutableCopy");
                if (v25)
                  objc_msgSend(v25, "transform");
                else
                  memset(&v77, 0, sizeof(v77));
                v76 = location;
                CGAffineTransformConcat(&v78, &v77, &v76);
                v75 = v78;
                objc_msgSend(v26, "_setTransform:", &v75);
                v27 = (void *)objc_msgSend(v26, "copy");
                objc_msgSend(v20, "addObject:", v27);

              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
            }
            while (v22);
          }

          v28 = objc_msgSend(v20, "copy");
          v54 = (void *)v28;
          v19 = v52;
        }

      }
      v14 = v54;
    }
    else
    {
      v16 = v3;
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v16, "_setIsSharedStroke:", *(unsigned __int8 *)(a1 + 80));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v29 = v14;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "_setIsSharedStroke:", *(unsigned __int8 *)(a1 + 80));
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
    }
    while (v30);
  }

  v33 = MEMORY[0x1E0C809B0];
  v34 = (_QWORD *)&unk_1BE4FB000;
  if (v16 && !*(_BYTE *)(a1 + 81))
  {
    v89 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_drawingController");
    v36 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v36 && (v37 = (v36[48] & 1) == 0, v36, !v37))
    {
      v39 = 1;
    }
    else
    {
      v38 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location.a) = 0;
        _os_log_error_impl(&dword_1BE213000, v38, OS_LOG_TYPE_ERROR, "Did not have live interaction lock at end of stroke", (uint8_t *)&location, 2u);
      }

      v39 = 0;
    }
    +[PKStatisticsManager sharedStatisticsManager]();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordDrawStroke:]((uint64_t)v40, v16);

    objc_initWeak((id *)&location, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_drawingController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(*(id *)(a1 + 40), "generateLiveDrawing");
    v43 = *(void **)(a1 + 48);
    v44 = v43 != 0;
    v65[0] = v33;
    v65[1] = 3221225472;
    v65[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_136;
    v65[3] = &unk_1E77783A0;
    v66 = v43;
    v67 = v29;
    objc_copyWeak(&v69, (id *)&location);
    v68 = v16;
    v70 = v39;
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:]((uint64_t)v41, v35, v42, v44, v65);

    objc_destroyWeak(&v69);
    objc_destroyWeak((id *)&location);

    v34 = &unk_1BE4FB000;
  }
  objc_msgSend(*(id *)(a1 + 40), "_rendererController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "strokeGenerator");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v33;
  v57 = v34[391];
  v47 = v57;
  v58 = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_3;
  v59 = &unk_1E77783C8;
  v48 = v16;
  v60 = v48;
  v49 = v29;
  v50 = *(_QWORD *)(a1 + 40);
  v51 = v49;
  v61 = v49;
  v62 = v50;
  v63 = *(id *)(a1 + 56);
  v64 = *(_BYTE *)(a1 + 81);
  -[PKMetalRendererController drawingEnded:finishStrokeBlock:]((uint64_t)v45, v46, &v56);

  block[0] = v33;
  block[1] = v47;
  block[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_5;
  block[3] = &unk_1E7776F38;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "_callOptionalDrawingEndedCompletion:withStroke:shapeStrokes:", *(_QWORD *)(a1 + 64), v48, v51);

}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_136(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (*(_QWORD *)(a1 + 32) && (v9 = objc_msgSend(*(id *)(a1 + 40), "count"), v8) && v7 && v9)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordCreateShapeWithType:fromMenu:multiple:]((uint64_t)v10, objc_msgSend(*(id *)(a1 + 32), "type"), 0, 0);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_drawingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2_137;
    v19[3] = &unk_1E7778378;
    objc_copyWeak(&v24, (id *)(a1 + 56));
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    v22 = v7;
    v23 = v8;
    v25 = *(_BYTE *)(a1 + 64);
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:]((uint64_t)v12, v13, 0, 0, v19);

    objc_destroyWeak(&v24);
  }
  else
  {
    if (v7)
    {
      v26 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    v16 = objc_loadWeakRetained((id *)(a1 + 56));
    v17 = v16;
    if ((a4 & 1) != 0)
      v18 = 0;
    else
      v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v16, "_handleEndOfStroke:shapeStrokes:groupedUndoCommands:invalidateTiles:", v18, 0, v15, *(_BYTE *)(a1 + 64) == 0);

  }
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2_137(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[PKShape snapToShapeActionNameForNumShapes:](PKShape, "snapToShapeActionNameForNumShapes:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionName:", v6);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v2;
    v11[0] = *(_QWORD *)(a1 + 56);
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(WeakRetained, "_handleEndOfStroke:shapeStrokes:groupedUndoCommands:invalidateTiles:", v8, v9, v10, *(_BYTE *)(a1 + 72) == 0);
  if (v5)
  {

  }
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_4;
  block[3] = &unk_1E77783C8;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = *(_BYTE *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v3 = *(id *)(a1 + 40);

    v2 = v3;
  }
  objc_msgSend(*(id *)(a1 + 48), "didEndLiveInteractionWithStrokes:drawing:cancelled:", v2, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

}

uint64_t __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postEndedSketchingAXAnnouncement");
}

- (void)_callOptionalDrawingEndedCompletion:(id)a3 withStroke:(id)a4 shapeStrokes:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PKTiledCanvasView__callOptionalDrawingEndedCompletion_withStroke_shapeStrokes___block_invoke;
    block[3] = &unk_1E7778418;
    v14 = v7;
    v12 = v8;
    v13 = v9;
    dispatch_async(v10, block);

  }
}

uint64_t __81__PKTiledCanvasView__callOptionalDrawingEndedCompletion_withStroke_shapeStrokes___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAlternativeStrokeIfNecessaryAccepted:(BOOL)a3
{
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;

  alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
  if (alternativeStrokesAnimation)
  {
    if (alternativeStrokesAnimation->_crossFadeStartTime == 0.0)
    {
      alternativeStrokesAnimation->_crossFadeStartTime = CACurrentMediaTime();
      alternativeStrokesAnimation->_accepted = a3;
    }
  }
}

- (void)drawingCancelled
{
  -[PKTiledCanvasView drawingCancelledForPreview:](self, "drawingCancelledForPreview:", 0);
}

- (void)drawingCancelledForPreview:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v5 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PKTiledCanvasView drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled drawing: %@", buf, 0xCu);

    }
  }
  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController resetStroke]((uint64_t)v7);

  -[PKTiledCanvasView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", 0);
  if (self->_isErasingObjects)
  {
    -[PKTiledCanvasView eraserCancelled](self, "eraserCancelled");
  }
  else
  {
    -[PKTiledCanvasView setIsDrawing:forPreview:](self, "setIsDrawing:forPreview:", 0, v3);
    -[PKTiledCanvasView rulerController](self, "rulerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKRulerController rulerSelected]((uint64_t)v8);

    if (v9)
    {
      -[PKTiledCanvasView rulerController](self, "rulerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRulerController drawingCancelled:]((uint64_t)v10);

    }
    -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
    v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v11[72] = 0;

    if (-[PKTiledCanvasView isHidden](self, "isHidden"))
    {
      -[PKTiledCanvasView metalView](self, "metalView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalView flushDrawables]((uint64_t)v12);

      -[PKTiledCanvasView schedulePurgeResourcesBlock](self, "schedulePurgeResourcesBlock");
    }
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKController cancelLiveStroke]((uint64_t)v13);

    -[PKTiledCanvasView drawing](self, "drawing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke;
    v17[3] = &unk_1E7778440;
    v17[4] = self;
    v19 = v3;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v15, "drawingCancelledWithCompletion:", v17);

    kdebug_trace();
  }
}

void __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_rendererController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController drawingCancelledForPreview:]((uint64_t)v4, *(_BYTE *)(a1 + 48));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke_2;
  v8[3] = &unk_1E7777B80;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(_BYTE *)(a1 + 48);
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v3[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(*(id *)(a1 + 40), "didEndLiveInteractionWithStrokes:drawing:cancelled:forPreview:", v2, *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 56));

}

- (void)setViewScissor:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_viewScissor = a3;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setViewScissor:]((uint64_t)v7, x, y, width, height);

}

- (void)setPaperTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id v6;
  __int128 v7[3];

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_paperTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_paperTransform.c = v4;
  *(_OWORD *)&self->_paperTransform.tx = v3;
  v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setPaperTransform:]((uint64_t)v6, v7);

}

- (void)setIsDrawing:(BOOL)a3
{
  -[PKTiledCanvasView setIsDrawing:forPreview:](self, "setIsDrawing:forPreview:", a3, 0);
}

- (void)setIsDrawing:(BOOL)a3 forPreview:(BOOL)a4
{
  _BOOL4 v5;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_isDrawing != a3)
  {
    v5 = a3;
    -[PKTiledCanvasView _drawingController](self, "_drawingController");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKController inputController](v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x400) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "canvasViewMaximumSupportedContentVersion:", self);

    }
    else
    {
      v8 = 3;
    }
    -[PKTiledCanvasView ink](self, "ink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setupForInk:maximumSupportedContentVersion:", v10, v8);

    self->_isDrawing = v5;
    if (!a4)
    {
      -[PKTiledCanvasView window](self, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if ((*(_WORD *)&self->_canvasViewFlags & 0x80) != 0)
        {
          -[PKTiledCanvasView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "canvasViewDidBeginDrawing:", self);

        }
      }
      else
      {
        if ((*(_WORD *)&self->_canvasViewFlags & 0x400) != 0)
        {
          -[PKTiledCanvasView delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "canvasViewDidEndDrawing:", self);

        }
        objc_msgSend(v12, "_saveStateIfNecessary");
      }
      -[PKTiledCanvasView updateHasVisibleStrokes](self, "updateHasVisibleStrokes");

    }
  }
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_class();
  -[PKTiledCanvasView _touchView](self, "_touchView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    memset(&v16, 0, sizeof(v16));
    objc_msgSend(v8, "tileContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v8, v9, &v16);

    memset(&v15, 0, sizeof(v15));
    objc_msgSend(v8, "drawingTransform");
    CGAffineTransformInvert(&v14, &v13);
    t1 = v16;
    t2 = v14;
    CGAffineTransformConcat(&v15, &t1, &t2);
    v10 = y * v15.d + v15.b * x;
    x = v15.tx + y * v15.c + v15.a * x;
    y = v15.ty + v10;
  }

  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  NSMutableArray *v9;
  NSMutableArray *strokesToErase;
  NSMutableSet *v11;
  NSMutableSet *strokeIDsToErase;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSMutableSet *v30;
  void *v31;
  NSMutableSet *v32;
  void *v33;
  id v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v59 = *MEMORY[0x1E0C80C00];
  if (!self->_strokesToErase)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    strokesToErase = self->_strokesToErase;
    self->_strokesToErase = v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    strokeIDsToErase = self->_strokeIDsToErase;
    self->_strokeIDsToErase = v11;

  }
  kdebug_trace();
  -[PKTiledCanvasView selectionController](self, "selectionController");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    WeakRetained = objc_loadWeakRetained((id *)(v13 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "liveAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "strokeSpatialCache");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17 && *(_BYTE *)(v17 + 8))
  {
    objc_msgSend(v16, "strokeSpatialCache");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = *(void **)(v19 + 24);
    else
      v21 = 0;
    v48 = v21;

  }
  else
  {
    v48 = 0;
  }

  v22 = os_log_create("com.apple.pencilkit", "Erase");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "strokeSpatialCache");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
      v41 = *(void **)(v39 + 24);
    else
      v41 = 0;
    v42 = v41;
    v43 = objc_msgSend(v42, "count");
    objc_msgSend(v16, "strokeSpatialCache");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    v46 = CFSTR("NO");
    if (v44 && *(_BYTE *)(v44 + 8))
      v46 = CFSTR("YES");
    *(_DWORD *)buf = 134218242;
    v56 = v43;
    v57 = 2112;
    v58 = v46;
    _os_log_debug_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEBUG, "Used cached %lu strokes: %@", buf, 0x16u);

  }
  -[PKTiledCanvasView drawing](self, "drawing");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v48, v7, v6, x, y);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  if (objc_msgSend(v49, "count"))
  {
    v47 = -[NSMutableArray count](self->_strokesToErase, "count");
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v49, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v24, 1);

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v51 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v30 = self->_strokeIDsToErase;
          objc_msgSend(v29, "_strokeUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = -[NSMutableSet containsObject:](v30, "containsObject:", v31);

          if ((v30 & 1) == 0)
          {
            -[NSMutableArray addObject:](self->_strokesToErase, "addObject:", v29);
            v32 = self->_strokeIDsToErase;
            objc_msgSend(v29, "_strokeUUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v32, "addObject:", v33);

          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v26);
    }

    if (-[NSMutableArray count](self->_strokesToErase, "count") != v47)
    {
      v34 = objc_loadWeakRetained((id *)&self->_selectionController);
      v35 = self->_strokesToErase;
      -[PKTiledCanvasView drawing](self, "drawing");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)v34, v35, v36, 0);

    }
    if ((*(_WORD *)&self->_canvasViewFlags & 0x2000) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "array");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_canvasViewDidEraseStrokes:", v38);

    }
  }

}

- (void)eraseStrokes:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *strokesToErase;
  NSMutableSet *v7;
  NSMutableSet *strokeIDsToErase;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableSet *v15;
  void *v16;
  NSMutableSet *v17;
  void *v18;
  id WeakRetained;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = v4;
  if (!self->_strokesToErase)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    strokesToErase = self->_strokesToErase;
    self->_strokesToErase = v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    strokeIDsToErase = self->_strokeIDsToErase;
    self->_strokeIDsToErase = v7;

    v4 = v25;
  }
  if (objc_msgSend(v4, "count"))
  {
    v24 = -[NSMutableArray count](self->_strokesToErase, "count");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v25, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v9, 1);

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = self->_strokeIDsToErase;
          objc_msgSend(v14, "_strokeUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v15) = -[NSMutableSet containsObject:](v15, "containsObject:", v16);

          if ((v15 & 1) == 0)
          {
            -[NSMutableArray addObject:](self->_strokesToErase, "addObject:", v14);
            v17 = self->_strokeIDsToErase;
            objc_msgSend(v14, "_strokeUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v17, "addObject:", v18);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    if (-[NSMutableArray count](self->_strokesToErase, "count") != v24)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
      v20 = self->_strokesToErase;
      -[PKTiledCanvasView drawing](self, "drawing");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, v20, v21, 0);

    }
    if ((*(_WORD *)&self->_canvasViewFlags & 0x2000) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_canvasViewDidEraseStrokes:", v23);

    }
  }

}

- (void)clearHiddenStrokes
{
  id WeakRetained;
  NSMutableArray *strokesToErase;
  NSMutableSet *strokeIDsToErase;

  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)WeakRetained);

  strokesToErase = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;

}

- (void)_didFinishErasingStrokes:(BOOL)a3
{
  NSMutableArray *strokesToErase;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  id v14;
  NSMutableArray *v15;
  NSMutableSet *strokeIDsToErase;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  strokesToErase = self->_strokesToErase;
  if (strokesToErase)
  {
    v5 = a3;
    if (-[NSMutableArray count](strokesToErase, "count"))
    {
      if (v5)
      {
        -[PKTiledCanvasView drawing](self, "drawing");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "undoableDeleteStrokes:", self->_strokesToErase);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && (*(_WORD *)&self->_canvasViewFlags & 0x80000000) != 0)
        {
          -[PKTiledCanvasView delegate](self, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "canvasView:registerUndoCommands:", self, v9);

        }
        -[PKTiledCanvasView drawing](self, "drawing");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledCanvasView drawingChanged:](self, "drawingChanged:", v10);

        v11 = os_log_create("com.apple.pencilkit", "Erase");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v17 = -[NSMutableArray count](self->_strokesToErase, "count");
          v18 = 134217984;
          v19 = v17;
          _os_log_debug_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEBUG, "Erased %lu strokes", (uint8_t *)&v18, 0xCu);
        }

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
      -[PKTiledCanvasView drawing](self, "drawing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, 0, v13, 0);

    }
  }
  v14 = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)v14);

  v15 = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;

}

- (BOOL)eraserBegan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __int16 canvasViewFlags;
  void *v9;
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
  NSObject *v20;
  uint8_t v22[16];

  v4 = a3;
  self->_isErasingObjects = 0;
  -[PKTiledCanvasView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.ink.objectEraser"));

  if (v7)
  {
    self->_isErasingObjects = 1;
    canvasViewFlags = (__int16)self->_canvasViewFlags;
    if ((canvasViewFlags & 2) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "canvasViewWillBeginNewStroke:withTouch:location:", self, v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

      canvasViewFlags = (__int16)self->_canvasViewFlags;
    }
    if ((canvasViewFlags & 0x80) != 0)
    {
      -[PKTiledCanvasView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "canvasViewDidBeginDrawing:", self);

    }
    -[PKTiledCanvasView _touchView](self, "_touchView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PK_preciseLocationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v13, v15);
    v17 = v16;
    v19 = v18;
    kdebug_trace();
    self->_isErasingObjects = 1;
    -[PKTiledCanvasView eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", v17, v19, v17, v19);
    -[PKTiledCanvasView set_oldEraseLocation:](self, "set_oldEraseLocation:", v17, v19);
    v20 = os_log_create("com.apple.pencilkit", "Erase");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v22 = 0;
      _os_log_debug_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEBUG, "Eraser began", v22, 2u);
    }

    -[PKTiledCanvasView _postBeganErasingAXAnnouncement](self, "_postBeganErasingAXAnnouncement");
  }

  return v7;
}

- (void)eraserMoved:(id)a3
{
  void *v4;
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
  void *v15;
  id v16;

  v16 = a3;
  -[PKTiledCanvasView _touchView](self, "_touchView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "PK_preciseLocationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v6, v8);
  v10 = v9;
  v12 = v11;
  -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", v16);
  -[PKTiledCanvasView _oldEraseLocation](self, "_oldEraseLocation");
  -[PKTiledCanvasView eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", v10, v12, v13, v14);
  -[PKTiledCanvasView set_oldEraseLocation:](self, "set_oldEraseLocation:", v10, v12);
  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canvasViewDrawingMoved:withTouch:", self, v16);

  }
}

- (void)eraserEnded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "Erase");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Eraser ended", v9, 2u);
  }

  self->_isErasingObjects = 0;
  -[PKTiledCanvasView _didFinishErasingStrokes:](self, "_didFinishErasingStrokes:", 1);
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordObjectEraseWithInputType:]((uint64_t)v6, objc_msgSend(v4, "type"));

  if ((*(_WORD *)&self->_canvasViewFlags & 0x400) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canvasViewDidEndDrawing:", self);

  }
  kdebug_trace();
  +[PKStatisticsManager sharedStatisticsManager]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordTool:]((uint64_t)v8, CFSTR("objectEraser"));

  -[PKTiledCanvasView _postEndedErasingAXAnnouncement](self, "_postEndedErasingAXAnnouncement");
}

- (void)eraserCancelled
{
  __int16 canvasViewFlags;
  id v4;
  id v5;

  self->_isErasingObjects = 0;
  -[PKTiledCanvasView _didFinishErasingStrokes:](self, "_didFinishErasingStrokes:", 0);
  canvasViewFlags = (__int16)self->_canvasViewFlags;
  if ((canvasViewFlags & 8) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canvasView:cancelledStroke:", self, 0);

    canvasViewFlags = (__int16)self->_canvasViewFlags;
  }
  if ((canvasViewFlags & 0x400) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasViewDidEndDrawing:", self);

  }
}

- (id)_strokeUUIDsForStrokes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_strokeUUID", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (void)liveStrokeParticlesToDestinationFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "copy");

  if (objc_msgSend(v10, "count"))
    -[PKTiledCanvasView animateStrokes:destinationFrame:duration:particles:](self, "animateStrokes:destinationFrame:duration:particles:", v10, 1, x, y, width, height, 1.0);

}

- (void)animateStrokes:(id)a3 destinationFrame:(CGRect)a4 duration:(double)a5 particles:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  PKLiveStrokesParticlesAnimation *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  PKTiledCanvasView *v33;
  id v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  -[PKTiledCanvasView strokeTransform](self, "strokeTransform");
  CGAffineTransformInvert(&v36, &v35);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v38 = CGRectApplyAffineTransform(v37, &v36);
  v14 = v38.origin.x;
  v15 = v38.origin.y;
  v16 = v38.size.width;
  v17 = v38.size.height;
  -[PKTiledCanvasView _strokeUUIDsForStrokes:](self, "_strokeUUIDsForStrokes:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView strokeUUIDsAboutToBeRemoved](self, "strokeUUIDsAboutToBeRemoved");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionSet:", v18);

  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke;
  v32 = &unk_1E7777440;
  v33 = self;
  v21 = v18;
  v34 = v21;
  -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v20, v13, &v29);

  v22 = CACurrentMediaTime();
  -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime", v29, v30, v31, v32, v33);
  if (v23 == 0.0)
    -[PKTiledCanvasView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", v22);
  if (a6)
  {
    v24 = -[PKLiveStrokesParticlesAnimation initWithStrokes:startTime:duration:destinationFrame:]([PKLiveStrokesParticlesAnimation alloc], "initWithStrokes:startTime:duration:destinationFrame:", v13, v22, a5, v14, v15, v16, v17);
    -[PKTiledCanvasView particlesToDestinationAnimations](self, "particlesToDestinationAnimations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v24);

    -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
    v27 = v26;
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController liveStrokeParticlesToFrame:strokes:startTime:duration:]((uint64_t)v28, v13, v14, v15, v16, v17, v22 - v27, a5);
  }
  else
  {
    v24 = (PKLiveStrokesParticlesAnimation *)-[PKTransformStrokesAnimation initWithStrokes:startTime:duration:destinationFrame:fadeOutDuration:]((id *)[PKTransformStrokesAnimation alloc], v13, v22, a5, v14, v15, v16, v17, a5 * 0.95);
    -[PKTiledCanvasView transformStrokesAnimations](self, "transformStrokesAnimations");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v24);
  }

  if (-[CADisplayLink isPaused](self->_displayLink, "isPaused"))
    -[PKTiledCanvasView setNeedsDrawingDisplay](self, "setNeedsDrawingDisplay");

}

void __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke_2;
  v2[3] = &unk_1E7777440;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "strokeUUIDsAboutToBeRemoved");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", *(_QWORD *)(a1 + 40));

}

- (void)setLiveAnimationStartTime:(double)a3
{
  if (self->_liveAnimationStartTime != a3)
  {
    self->_liveAnimationStartTime = a3;
    -[PKTiledCanvasView updateHasVisibleStrokes](self, "updateHasVisibleStrokes");
  }
}

- (void)checkAnimationsDidEndAtTime:(double)a3
{
  double v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  double crossFadeStartTime;
  PKInterpolateColorAnimation *liveRenderingOverrideColorAnimation;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSMutableArray *strokeRenderCachesToPurge;
  NSMutableArray *v31;
  NSMutableArray *v32;
  id v33;

  -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
  if (v5 != 0.0)
  {
    v6 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_fadeOutStrokeAnimations, "count"))
    {
      v7 = 0;
      v8 = -[NSMutableArray count](self->_fadeOutStrokeAnimations, "count");
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_fadeOutStrokeAnimations, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isDoneAtTime:", a3))
          {
            objc_msgSend(v10, "stroke");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v11);

            if (!v7)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "addIndex:", i);
          }

        }
        if (v7)
          -[NSMutableArray removeObjectsAtIndexes:](self->_fadeOutStrokeAnimations, "removeObjectsAtIndexes:", v7);
      }

    }
    if (-[NSMutableArray count](self->_particlesToDestinationAnimations, "count"))
    {
      v12 = -[NSMutableArray count](self->_particlesToDestinationAnimations, "count");
      if (v12)
      {
        v13 = 0;
        v14 = 0;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_particlesToDestinationAnimations, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isDoneAtTime:", a3))
          {
            objc_msgSend(v15, "strokes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObjectsFromArray:", v16);

            if (!v14)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v14, "addIndex:", v13);
          }

          ++v13;
        }
        while (v12 != v13);
        if (v14)
          -[NSMutableArray removeObjectsAtIndexes:](self->_particlesToDestinationAnimations, "removeObjectsAtIndexes:", v14);
      }
      else
      {
        v14 = 0;
      }

    }
    if (-[NSMutableArray count](self->_transformStrokesAnimations, "count"))
    {
      v17 = -[NSMutableArray count](self->_transformStrokesAnimations, "count");
      if (v17)
      {
        v18 = 0;
        v19 = 0;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_transformStrokesAnimations, "objectAtIndexedSubscript:", v18);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v20 && *(double *)(v20 + 16) + *(double *)(v20 + 24) <= a3)
          {
            v22 = *(id *)(v20 + 8);
            objc_msgSend(v33, "addObjectsFromArray:", v22);

            if (!v19)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "addIndex:", v18);
          }

          ++v18;
        }
        while (v17 != v18);
        if (v19)
        {
          -[NSMutableArray removeObjectsAtIndexes:](self->_transformStrokesAnimations, "removeObjectsAtIndexes:", v19);
          v6 = 0x1E0C99000;
        }
        else
        {
          v6 = 0x1E0C99000uLL;
        }
      }
      else
      {
        v19 = 0;
      }

    }
    alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
    {
      if (alternativeStrokesAnimation->_forceDone
        || (crossFadeStartTime = alternativeStrokesAnimation->_crossFadeStartTime, crossFadeStartTime > 0.0)
        && crossFadeStartTime + alternativeStrokesAnimation->_fadeDuration <= a3)
      {
        self->_alternativeStrokesAnimation = 0;

      }
    }
    liveRenderingOverrideColorAnimation = self->_liveRenderingOverrideColorAnimation;
    if (liveRenderingOverrideColorAnimation
      && liveRenderingOverrideColorAnimation->_startTime + liveRenderingOverrideColorAnimation->_duration <= a3)
    {
      self->_liveRenderingOverrideColorAnimation = 0;

      -[PKTiledCanvasView _rendererController](self, "_rendererController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v26, -[UIColor CGColor](self->_liveRenderingOverrideColor, "CGColor"));

    }
    if (!-[NSMutableArray count](self->_fadeOutStrokeAnimations, "count")
      && !-[NSMutableArray count](self->_particlesToDestinationAnimations, "count")
      && !-[NSMutableArray count](self->_fadeOutStrokeAnimations, "count")
      && !self->_alternativeStrokesAnimation
      && !self->_liveRenderingOverrideColorAnimation
      && !-[NSMutableArray count](self->_transformStrokesAnimations, "count"))
    {
      -[PKTiledCanvasView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", 0.0);
      -[PKTiledCanvasView delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        -[PKTiledCanvasView delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "canvasViewDidFinishAnimatingStrokes:", self);

      }
    }
    if (objc_msgSend(v33, "count"))
    {
      strokeRenderCachesToPurge = self->_strokeRenderCachesToPurge;
      if (!strokeRenderCachesToPurge)
      {
        objc_msgSend(*(id *)(v6 + 3560), "arrayWithCapacity:", objc_msgSend(v33, "count"));
        v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v32 = self->_strokeRenderCachesToPurge;
        self->_strokeRenderCachesToPurge = v31;

        strokeRenderCachesToPurge = self->_strokeRenderCachesToPurge;
      }
      -[NSMutableArray addObjectsFromArray:](strokeRenderCachesToPurge, "addObjectsFromArray:", v33);
    }

  }
}

- (void)testHideOldestStroke
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView fadeOutAndHideStrokes:duration:](self, "fadeOutAndHideStrokes:duration:", v7, 0.3);

  }
}

- (void)fadeOutAndHideStrokes:(id)a3 duration:(double)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  PKFadeOutStrokeAnimation *v15;
  NSMutableArray *fadeOutStrokeAnimations;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = CACurrentMediaTime();
  -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
  if (v8 == 0.0)
    -[PKTiledCanvasView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", v7);
  -[PKTiledCanvasView _strokeUUIDsForStrokes:](self, "_strokeUUIDsForStrokes:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView strokeUUIDsAboutToBeRemoved](self, "strokeUUIDsAboutToBeRemoved");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v19);

  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke;
  v25[3] = &unk_1E7777440;
  v25[4] = self;
  v20 = v19;
  v26 = v20;
  -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v10, v6, v25);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        v15 = -[PKFadeOutStrokeAnimation initWithStroke:startTime:duration:]([PKFadeOutStrokeAnimation alloc], "initWithStroke:startTime:duration:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v7, a4);
        fadeOutStrokeAnimations = self->_fadeOutStrokeAnimations;
        if (!fadeOutStrokeAnimations)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          v18 = self->_fadeOutStrokeAnimations;
          self->_fadeOutStrokeAnimations = v17;

          fadeOutStrokeAnimations = self->_fadeOutStrokeAnimations;
        }
        -[NSMutableArray addObject:](fadeOutStrokeAnimations, "addObject:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v12);
  }

  -[PKTiledCanvasView setNeedsDrawingDisplay](self, "setNeedsDrawingDisplay");
}

void __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke_2;
  v2[3] = &unk_1E7777440;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "strokeUUIDsAboutToBeRemoved");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", *(_QWORD *)(a1 + 40));

}

- (void)removeStuckStrokesAndSimulateCrashIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[PKTiledCanvasView drawing](self, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isEmpty");

    if (v5)
    {
      v6 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        -[PKTiledCanvasView _drawingController](self, "_drawingController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKController renderedStrokes](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKDrawing _uuidDescriptionForStrokes:](PKDrawing, "_uuidDescriptionForStrokes:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_fault_impl(&dword_1BE213000, v6, OS_LOG_TYPE_FAULT, "Detected stuck strokes on canvas (<rdar://problem/50709761>): %@", buf, 0xCu);

      }
      -[PKTiledCanvasView _drawingController](self, "_drawingController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledCanvasView _drawingController](self, "_drawingController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKController renderedStrokes](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v7, v9, 0);

    }
  }
  else
  {

  }
}

- (CGSize)_metalViewDrawableSize
{
  PKMetalView *metalView;
  double v4;
  double v5;
  CGSize result;

  -[PKTiledCanvasView setupMetalViewIfNecessary](self, "setupMetalViewIfNecessary");
  metalView = self->_metalView;
  if (metalView)
  {
    -[CAMetalLayer drawableSize](metalView->_metalLayer, "drawableSize");
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_rendererControllerPixelSize
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PKTiledCanvasView setupMetalViewIfNecessary](self, "setupMetalViewIfNecessary");
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3[13];
    v4 = v3[14];
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }

  v6 = v5;
  v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setCanvasOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  self->_canvasOffset = a3;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setCanvasOffset:]((uint64_t)v5, x, y);

}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  -[PKTiledCanvasView _rendererController](self, "_rendererController", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  PKAlternativeStrokesAnimation *v17;
  void *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[17];
  _QWORD v32[5];
  _OWORD v33[8];

  if (!self->_combiningStrokesCount)
  {
    v4 = a4;
    -[PKTiledCanvasView _finishCombiningStrokesIfNecessary](self, "_finishCombiningStrokesIfNecessary", a3);
    -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSnappedToRuler");

    if ((v7 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledCanvasView _inputScale](self, "_inputScale");
      v11 = v10;
      -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        -[PKAveragePointGenerator currentInputPoint](*(_QWORD *)(v12 + 120), (uint64_t)v33);
      else
        memset(v33, 0, sizeof(v33));
      if (v4)
        v14 = &unk_1E77EC958;
      else
        v14 = 0;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __78__PKTiledCanvasView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke;
      v32[3] = &unk_1E7778350;
      v32[4] = self;
      -[PKShapeDrawingController detectedShapeWithInputScale:averageInputPoint:allowedShapeTypes:createCurrentStrokeBlock:]((uint64_t)v9, v33, v14, v32, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v15 = CACurrentMediaTime();
        -[PKTiledCanvasView liveAnimationStartTime](self, "liveAnimationStartTime");
        if (v16 == 0.0)
          -[PKTiledCanvasView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", v15);
        if (objc_msgSend(v8, "type") != 13)
        {
          v17 = [PKAlternativeStrokesAnimation alloc];
          objc_msgSend(v8, "strokes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[PKAlternativeStrokesAnimation initWithStrokes:shape:startTime:fadeDuration:]((id *)&v17->super.isa, v18, v8, v15, 0.15);
          -[PKTiledCanvasView setAlternativeStrokesAnimation:](self, "setAlternativeStrokesAnimation:", v19);

        }
        -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShapeDrawingController setDetectedShape:]((uint64_t)v20, v8);

        if (_os_feature_enabled_impl())
        {
          v21 = os_log_create("com.apple.pencilkit", "Feedback");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31[0]) = 0;
            _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "[Canvas Feedback Event] shape recognized.", (uint8_t *)v31, 2u);
          }

          -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
          {
            -[PKAveragePointGenerator currentInputPoint](*(_QWORD *)(v22 + 120), (uint64_t)v31);
            v25 = *(double *)v31;
            v24 = *(double *)&v31[1];
          }
          else
          {
            v24 = 0.0;
            v25 = 0.0;
          }

          -[_UICanvasFeedbackGenerator view](self->_feedbackGenerator, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledCanvasView convertPoint:toView:](self, "convertPoint:toView:", v26, v25, v24);
          v28 = v27;
          v30 = v29;

          -[_UICanvasFeedbackGenerator pathCompletedAtLocation:](self->_feedbackGenerator, "pathCompletedAtLocation:", v28, v30);
        }
      }
    }

  }
}

id __78__PKTiledCanvasView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "strokeGenerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "newStrokeWithCurrentData");

  return v2;
}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  void *v4;

  -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)v4, 0);

  -[PKTiledCanvasView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", 0);
}

- (int64_t)shapeDrawingControllerMaximumSupportedContentVersion:(id)a3
{
  int64_t v3;
  void *v5;

  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x400) == 0)
    return 3;
  -[PKTiledCanvasView delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "canvasViewMaximumSupportedContentVersion:", self);

  return v3;
}

- (void)setIsPDFCanvasForAnalytics:(BOOL)a3
{
  id v4;

  self->_isPDFCanvasForAnalytics = a3;
  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController setIsPDFCanvasForAnalytics:]((uint64_t)v4, a3);

}

- (void)strokeGeneratorDidSnapToRuler:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (_os_feature_enabled_impl())
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__PKTiledCanvasView_strokeGeneratorDidSnapToRuler___block_invoke;
    v4[3] = &unk_1E7777B30;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__PKTiledCanvasView_strokeGeneratorDidSnapToRuler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.pencilkit", "Feedback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "[Canvas Feedback Event] snap-to-ruler recognized.", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(WeakRetained, "strokeGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "_latestStrokePoint");
      v6 = *((double *)&v12 + 1);
      v5 = *(double *)&v13;
    }
    else
    {
      v17 = 0;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
      v5 = 0.0;
      v6 = 0.0;
    }

    objc_msgSend(WeakRetained[55], "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertPoint:toView:", v7, v6, v5);
    v9 = v8;
    v11 = v10;

    objc_msgSend(WeakRetained[55], "snappingOccurredAtLocation:", v9, v11);
  }

}

- (BOOL)shapeDrawingController:(id)a3 scratchOutStrokesCoveredByStroke:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PKScratchOutController *scratchOutController;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL4 v13;
  PKScratchOutController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, char);
  void *v23;
  PKTiledCanvasView *v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__158;
  v38 = __Block_byref_object_dispose__159;
  -[PKTiledCanvasView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView drawing](self, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasView:attachmentViewForDrawing:", self, v7);
  v39 = (id)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__158;
  v32 = __Block_byref_object_dispose__159;
  scratchOutController = self->_scratchOutController;
  v9 = (void *)v35[5];
  -[PKTiledCanvasView drawing](self, "drawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKScratchOutController intersectedStrokesForStroke:attachmentView:drawing:](scratchOutController, v5, v9, v10);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend((id)v29[5], "count") > 0x3E8
    || (unint64_t)objc_msgSend((id)v29[5], "count") >= 0x1F5
    && (unint64_t)objc_msgSend(v5, "_pointsCount") >= 0x1F5)
  {
    v11 = os_log_create("com.apple.pencilkit", "Actions");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend((id)v29[5], "count");
      *(_DWORD *)buf = 134217984;
      v41 = v12;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Scratch Out intersected %lu strokes, cancelling due to too many.", buf, 0xCu);
    }

    LOBYTE(v13) = 0;
  }
  else
  {
    v14 = self->_scratchOutController;
    objc_msgSend((id)v29[5], "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKScratchOutController intersectedStrokesFilteredByCoverageThresholdForStroke:intersectedStrokes:]((uint64_t)v14, v5, v15);
    v11 = objc_claimAutoreleasedReturnValue();

    v13 = -[NSObject count](v11, "count") != 0;
    objc_initWeak((id *)buf, self);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke;
    v23 = &unk_1E7778490;
    objc_copyWeak(&v27, (id *)buf);
    v24 = self;
    v25 = &v28;
    v26 = &v34;
    v16 = _Block_copy(&v20);
    if (v13)
    {
      -[PKTiledCanvasView delegate](self, "delegate", v20, v21, v22, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledCanvasView drawing](self, "drawing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "canvasView:textStrokesCoveredByStroke:drawing:completion:", self, v5, v18, v16);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

void __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke_2;
  block[3] = &unk_1E7778468;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v12 = v7;
  v13 = v8;
  v14 = *(_OWORD *)(a1 + 32);
  v17 = a4;
  v15 = *(_QWORD *)(a1 + 48);
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  __int16 v23[8];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "scratchOutController");
    v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    -[PKScratchOutController strokeIntersectionBetweenAllStrokes:textStrokesToDelete:textStrokesToKeep:](v4, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(void **)(a1 + 32), *(void **)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "drawingGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setState:", 5);

    objc_msgSend(*(id *)(a1 + 48), "drawingCancelled");
    objc_msgSend(v3, "scratchOutController");
    v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && v7[8] && *(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v3, "selectionController");
      v9 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = os_log_create("com.apple.pencilkit", "Actions");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Scratch Out recognized only text strokes, trigger Reflow.", buf, 2u);
        }

        objc_msgSend(v3, "selectionController");
        v14 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction](v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "selectionController");
        v17 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction](v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "selectionInteraction:handleDeleteForTextStrokes:inAttachment:", v18, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

LABEL_16:
        goto LABEL_17;
      }
    }
    else
    {

    }
    v19 = os_log_create("com.apple.pencilkit", "Actions");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 0;
      _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Scratch Out recognized a mix of text and drawing strokes, do not trigger Reflow.", (uint8_t *)v23, 2u);
    }

    v20 = objc_msgSend(v5, "mutableCopy");
    v21 = v3[100];
    v3[100] = (id)v20;

    if (((_WORD)v3[57] & 0x2000) != 0 && objc_msgSend(v3[100], "count"))
    {
      objc_msgSend(v3, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_canvasViewDidEraseStrokes:", v3[100]);

    }
    objc_msgSend(v3, "eraserEnded:", 0);
    objc_msgSend(v3, "setIsScratchOutPending:", 1);
    goto LABEL_16;
  }
LABEL_17:

}

- (void)_postAXAnnouncement:(id)a3
{
  PKAccessibilityPostAnnouncementNotificationWithPriority(self, a3, 1);
}

- (void)_postBeganErasingAXAnnouncement
{
  void *v3;
  id v4;

  if (!-[PKTiledCanvasView disableAXDrawingAnnouncements](self, "disableAXDrawingAnnouncements"))
  {
    _PencilKitBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Began erasing"), CFSTR("Began erasing"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _postAXAnnouncement:](self, "_postAXAnnouncement:", v3);

  }
}

- (void)_postEndedErasingAXAnnouncement
{
  void *v3;
  id v4;

  if (!-[PKTiledCanvasView disableAXDrawingAnnouncements](self, "disableAXDrawingAnnouncements"))
  {
    _PencilKitBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Ended erasing"), CFSTR("Ended erasing"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _postAXAnnouncement:](self, "_postAXAnnouncement:", v3);

  }
}

- (void)_postBeganSketchingAXAnnouncement
{
  void *v3;
  id v4;

  if (!-[PKTiledCanvasView disableAXDrawingAnnouncements](self, "disableAXDrawingAnnouncements"))
  {
    _PencilKitBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Began sketching"), CFSTR("Began sketching"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _postAXAnnouncement:](self, "_postAXAnnouncement:", v3);

  }
}

- (void)_postEndedSketchingAXAnnouncement
{
  void *v3;
  id v4;

  if (!-[PKTiledCanvasView disableAXDrawingAnnouncements](self, "disableAXDrawingAnnouncements"))
  {
    _PencilKitBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Ended sketching"), CFSTR("Ended sketching"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _postAXAnnouncement:](self, "_postAXAnnouncement:", v3);

  }
}

- (BOOL)_hasStrokeTransformChanged
{
  _OWORD *v3;
  void *v4;
  __int128 v5;
  _BOOL4 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];

  if (-[PKTiledCanvasView isDrawing](self, "isDrawing"))
  {
    -[PKTiledCanvasView scaledStrokeTransform](self, "scaledStrokeTransform");
    memset(v11, 0, sizeof(v11));
    -[PKTiledCanvasView _rendererController](self, "_rendererController");
    v3 = (_OWORD *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3[42];
      v8 = v3[41];
      v9 = v5;
      v10 = v3[43];
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v6 = !DKDNearlyEqualTransforms((double *)v11, (double *)&v8);

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_previewDrawingBegan:(id *)a3 tiledViewLocation:(CGPoint)a4 disableDetachedRendering:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[8];
  uint8_t buf[16];

  v5 = a5;
  y = a4.y;
  x = a4.x;
  -[PKTiledCanvasView setIsPreviewing:](self, "setIsPreviewing:", 1);
  v10 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Began preview drawing", buf, 2u);
  }

  v11 = *(_OWORD *)&a3->var9;
  v15[4] = *(_OWORD *)&a3->var7;
  v15[5] = v11;
  v12 = *(_OWORD *)&a3->var13;
  v15[6] = *(_OWORD *)&a3->var11;
  v15[7] = v12;
  v13 = *(_OWORD *)&a3->var1;
  v15[0] = a3->var0;
  v15[1] = v13;
  v14 = *(_OWORD *)&a3->var5;
  v15[2] = *(_OWORD *)&a3->var3;
  v15[3] = v14;
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", 0, v15, 1, v5, 23, 1, x, y);
}

- (void)_previewDrawingMoved:(id *)a3 tiledViewLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22[8];
  _OWORD v23[8];

  y = a4.y;
  x = a4.x;
  -[PKTiledCanvasView rulerController](self, "rulerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKRulerController rulerSelected]((uint64_t)v8);

  if (v9)
  {
    -[PKTiledCanvasView rulerController](self, "rulerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledCanvasView _touchView](self, "_touchView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerController drawingMoved:coordinateSystem:]((uint64_t)v10, v11, x, y);

  }
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a3->var9;
  v23[4] = *(_OWORD *)&a3->var7;
  v23[5] = v13;
  v14 = *(_OWORD *)&a3->var13;
  v23[6] = *(_OWORD *)&a3->var11;
  v23[7] = v14;
  v15 = *(_OWORD *)&a3->var1;
  v23[0] = a3->var0;
  v23[1] = v15;
  v16 = *(_OWORD *)&a3->var5;
  v23[2] = *(_OWORD *)&a3->var3;
  v23[3] = v16;
  objc_msgSend(v12, "addPoint:", v23);

  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)&a3->var9;
  v22[4] = *(_OWORD *)&a3->var7;
  v22[5] = v18;
  v19 = *(_OWORD *)&a3->var13;
  v22[6] = *(_OWORD *)&a3->var11;
  v22[7] = v19;
  v20 = *(_OWORD *)&a3->var1;
  v22[0] = (__int128)a3->var0;
  v22[1] = v20;
  v21 = *(_OWORD *)&a3->var5;
  v22[2] = *(_OWORD *)&a3->var3;
  v22[3] = v21;
  -[PKMetalRendererController addInputPoint:]((uint64_t)v17, v22);

}

- (void)_previewDrawingEnded
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PKTiledCanvasView setIsPreviewing:](self, "setIsPreviewing:", 0);
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsPreviewing:", 0);

  v4 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Ended preview drawing", v5, 2u);
  }

  -[PKTiledCanvasView drawingCancelledForPreview:](self, "drawingCancelledForPreview:", 1);
}

- (void)_replayDrawingBegan:(id *)a3
{
  void *v4;
  __int128 v5;

  -[PKTiledCanvasView _touchView](self, "_touchView", *(_QWORD *)&a3->var0.var0.x, *(_QWORD *)&a3->var0.var0.y, *(_QWORD *)&a3->var1, *(_QWORD *)&a3->var2, *(_QWORD *)&a3->var3, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var5, *(_QWORD *)&a3->var6, *(_QWORD *)&a3->var7, *(_QWORD *)&a3->var8, a3->var9, *(_QWORD *)&a3->var10, *(_QWORD *)&a3->var11, *(_QWORD *)&a3->var12, a3->var13, a3->var14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView _replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:](self, "_replayDrawingBegan:coordinateSpace:activeInputProperties:inputType:", &v5, v4, 23, 1);

}

- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6
{
  id v10;
  __int128 v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];
  _OWORD v22[3];

  v10 = a4;
  self->_replayInputType = a6;
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v10, self, v22);
  v11 = v22[1];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.a = v22[0];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v11;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tx = v22[2];
  -[PKTiledCanvasView _touchView](self, "_touchView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v10, a3->var0.var0.x, a3->var0.var0.y);
  v14 = v13;
  v16 = v15;

  v17 = *(_OWORD *)&a3->var9;
  v21[4] = *(_OWORD *)&a3->var7;
  v21[5] = v17;
  v18 = *(_OWORD *)&a3->var13;
  v21[6] = *(_OWORD *)&a3->var11;
  v21[7] = v18;
  v19 = *(_OWORD *)&a3->var1;
  v21[0] = a3->var0;
  v21[1] = v19;
  v20 = *(_OWORD *)&a3->var5;
  v21[2] = *(_OWORD *)&a3->var3;
  v21[3] = v20;
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", 0, v21, 0, 0, a5, a6, v14, v16);

}

- (void)_replayDrawingMoved:(id *)a3
{
  void *v4;
  __int128 v5;

  -[PKTiledCanvasView _touchView](self, "_touchView", *(_QWORD *)&a3->var0.var0.x, *(_QWORD *)&a3->var0.var0.y, *(_QWORD *)&a3->var1, *(_QWORD *)&a3->var2, *(_QWORD *)&a3->var3, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var5, *(_QWORD *)&a3->var6, *(_QWORD *)&a3->var7, *(_QWORD *)&a3->var8, a3->var9, *(_QWORD *)&a3->var10, *(_QWORD *)&a3->var11, *(_QWORD *)&a3->var12, a3->var13, a3->var14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView _replayDrawingMoved:coordinateSpace:](self, "_replayDrawingMoved:coordinateSpace:", &v5, v4);

}

- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  CFTimeInterval *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  double x;
  double y;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  int v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  double *v53;
  double v54;
  _OWORD v55[8];
  _OWORD v56[8];
  __int128 v57[8];
  _OWORD v58[8];

  v6 = a4;
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inputType");

  if (v8 == 1)
  {
    +[PKPencilDevice activePencil]();
    v9 = (CFTimeInterval *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v9[2] = CACurrentMediaTime();

  }
  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->var9;
  v58[4] = *(_OWORD *)&a3->var7;
  v58[5] = v11;
  v12 = *(_OWORD *)&a3->var13;
  v58[6] = *(_OWORD *)&a3->var11;
  v58[7] = v12;
  v13 = *(_OWORD *)&a3->var1;
  v58[0] = a3->var0;
  v58[1] = v13;
  v14 = *(_OWORD *)&a3->var5;
  v58[2] = *(_OWORD *)&a3->var3;
  v58[3] = v14;
  objc_msgSend(v10, "addPoint:", v58);

  -[PKTiledCanvasView _rendererController](self, "_rendererController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a3->var9;
  v57[4] = *(_OWORD *)&a3->var7;
  v57[5] = v16;
  v17 = *(_OWORD *)&a3->var13;
  v57[6] = *(_OWORD *)&a3->var11;
  v57[7] = v17;
  v18 = *(_OWORD *)&a3->var1;
  v57[0] = (__int128)a3->var0;
  v57[1] = v18;
  v19 = *(_OWORD *)&a3->var5;
  v57[2] = *(_OWORD *)&a3->var3;
  v57[3] = v19;
  -[PKMetalRendererController addInputPoint:]((uint64_t)v15, v57);

  if ((*(_WORD *)&self->_canvasViewFlags & 0x200) != 0)
  {
    -[PKTiledCanvasView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_OWORD *)&a3->var9;
    v56[4] = *(_OWORD *)&a3->var7;
    v56[5] = v21;
    v22 = *(_OWORD *)&a3->var13;
    v56[6] = *(_OWORD *)&a3->var11;
    v56[7] = v22;
    v23 = *(_OWORD *)&a3->var1;
    v56[0] = a3->var0;
    v56[1] = v23;
    v24 = *(_OWORD *)&a3->var5;
    v56[2] = *(_OWORD *)&a3->var3;
    v56[3] = v24;
    objc_msgSend(v20, "replayCanvasViewDrawingMoved:inputPoint:inputType:", self, v56, self->_replayInputType);

  }
  if (!a3->var8)
  {
    -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
    v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v27 = v25[1];
      v26 = v25[2];

      if (v26 == v27)
        goto LABEL_12;
      x = a3->var0.var0.x;
      y = a3->var0.var0.y;
      -[PKTiledCanvasView window](self, "window");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v30, x, y);
      v32 = v31;
      v34 = v33;

      -[PKTiledCanvasView shapeDrawingController](self, "shapeDrawingController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_OWORD *)&a3->var9;
      v55[4] = *(_OWORD *)&a3->var7;
      v55[5] = v36;
      v37 = *(_OWORD *)&a3->var13;
      v55[6] = *(_OWORD *)&a3->var11;
      v55[7] = v37;
      v38 = *(_OWORD *)&a3->var1;
      v55[0] = a3->var0;
      v55[1] = v38;
      v39 = *(_OWORD *)&a3->var5;
      v55[2] = *(_OWORD *)&a3->var3;
      v55[3] = v39;
      -[PKShapeDrawingController addStrokePoint:inputPoint:]((uint64_t)v35, v55, v32, v34);
    }
    else
    {
      v35 = 0;
    }

LABEL_12:
    if (!a3->var8)
    {
      -[PKTiledCanvasView ink](self, "ink");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "_isEraserInk");

      if (v41)
        -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", 0, a3->var0.var0.x, a3->var0.var0.y);
      v42 = a3->var0.var0.x;
      v43 = a3->var0.var0.y;
      -[PKTiledCanvasView _touchView](self, "_touchView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v44, v42, v43);
      v46 = v45;
      v48 = v47;

      -[PKTiledCanvasView rulerController](self, "rulerController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PKRulerController rulerSelected]((uint64_t)v49);

      if (v50)
      {
        -[PKTiledCanvasView rulerController](self, "rulerController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTiledCanvasView _touchView](self, "_touchView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKRulerController drawingMoved:coordinateSystem:]((uint64_t)v51, v52, v46, v48);

      }
      -[PKTiledCanvasView powerSavingController](self, "powerSavingController");
      v53 = (double *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        v54 = v53[6] + sqrt((v53[5] - v48) * (v53[5] - v48) + (v53[4] - v46) * (v53[4] - v46));
        v53[5] = v48;
        v53[6] = v54;
        v53[4] = v46;
      }

    }
  }

}

- (void)_replayDrawingEnded
{
  -[PKTiledCanvasView _replayDrawingEndedWithBackgroundQueueCompletion:](self, "_replayDrawingEndedWithBackgroundQueueCompletion:", 0);
}

- (void)_replayDrawingEndedWithBackgroundQueueCompletion:(id)a3
{
  -[PKTiledCanvasView _replayDrawingEndedEstimatesTimeout:withBackgroundQueueCompletion:](self, "_replayDrawingEndedEstimatesTimeout:withBackgroundQueueCompletion:", a3, 0.1);
}

- (void)_replayDrawingEndedEstimatesTimeout:(double)a3 withBackgroundQueueCompletion:(id)a4
{
  __int128 v4;
  __int128 v5;

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&self->__replayCoordinateSystemTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v5;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tx = v4;
  -[PKTiledCanvasView _drawingEnded:estimatesTimeout:completion:](self, "_drawingEnded:estimatesTimeout:completion:", 0, a4, a3);
}

- (void)_replayDrawingCancelled
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&self->__replayCoordinateSystemTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v4;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tx = v3;
  -[PKTiledCanvasView _drawingController](self, "_drawingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKController renderedStrokes](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledCanvasView fadeOutAndHideStrokes:duration:](self, "fadeOutAndHideStrokes:duration:", v6, 0.0);

  -[PKTiledCanvasView cancelPurgeResourcesBlock](self, "cancelPurgeResourcesBlock");
  -[PKTiledCanvasView drawingCancelled](self, "drawingCancelled");
}

- (void)_replayEstimatedPropertiesUpdated:(id *)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  -[PKTiledCanvasView strokeGenerator](self, "strokeGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v5;
  v6 = *(_OWORD *)&a3->var13;
  v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = v6;
  v7 = *(_OWORD *)&a3->var1;
  v9[0] = a3->var0;
  v9[1] = v7;
  v8 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v8;
  objc_msgSend(v4, "drawingUpdatePoint:", v9);

}

- (CAMetalLayer)metalLayer
{
  id *v2;
  void *v3;

  -[PKTiledCanvasView metalView](self, "metalView");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKMetalView metalLayer](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMetalLayer *)v3;
}

- (PKTiledCanvasViewDelegate)delegate
{
  return (PKTiledCanvasViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKLinedPaper)linedPaper
{
  return self->_linedPaper;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (BOOL)hasVisibleStrokes
{
  return self->_hasVisibleStrokes;
}

- (BOOL)useLuminanceColorFilter
{
  return self->_useLuminanceColorFilter;
}

- (BOOL)isUnderBlendedContent
{
  return self->_isUnderBlendedContent;
}

- (BOOL)captureLiveData
{
  return self->_captureLiveData;
}

- (BOOL)generateLiveDrawing
{
  return self->_generateLiveDrawing;
}

- (void)setGenerateLiveDrawing:(BOOL)a3
{
  self->_generateLiveDrawing = a3;
}

- (UIColor)liveRenderingOverrideColor
{
  return self->_liveRenderingOverrideColor;
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)objc_loadWeakRetained((id *)&self->_selectionController);
}

- (PKMetalConfig)metalConfig
{
  return self->_metalConfig;
}

- (BOOL)isErasingObjects
{
  return self->_isErasingObjects;
}

- (void)setIsErasingObjects:(BOOL)a3
{
  self->_isErasingObjects = a3;
}

- (double)latestRenderTimestamp
{
  return self->_latestRenderTimestamp;
}

- (BOOL)predictionDisabled
{
  return self->_predictionDisabled;
}

- (void)setPredictionDisabled:(BOOL)a3
{
  self->_predictionDisabled = a3;
}

- (double)metalLayerContentsScaleOverride
{
  return self->_metalLayerContentsScaleOverride;
}

- (CGAffineTransform)paperTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[21].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[21].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[21].tx;
  return self;
}

- (BOOL)enableCanvasOffsetSupport
{
  return self->_enableCanvasOffsetSupport;
}

- (void)setEnableCanvasOffsetSupport:(BOOL)a3
{
  self->_enableCanvasOffsetSupport = a3;
}

- (CGPoint)canvasOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_canvasOffset.x;
  y = self->_canvasOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)viewScissor
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewScissor.origin.x;
  y = self->_viewScissor.origin.y;
  width = self->_viewScissor.size.width;
  height = self->_viewScissor.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)liveStrokeMode
{
  return self->_liveStrokeMode;
}

- (CGSize)liveStrokeMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_liveStrokeMaxSize.width;
  height = self->_liveStrokeMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)resourceCacheSize
{
  return self->_resourceCacheSize;
}

- (BOOL)disableAXDrawingAnnouncements
{
  return self->_disableAXDrawingAnnouncements;
}

- (void)setDisableAXDrawingAnnouncements:(BOOL)a3
{
  self->_disableAXDrawingAnnouncements = a3;
}

- (PKDrawing)currentDrawingBeingCopiedToCanvas
{
  return (PKDrawing *)objc_loadWeakRetained((id *)&self->_currentDrawingBeingCopiedToCanvas);
}

- (CGAffineTransform)_replayCoordinateSystemTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[22].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[22].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[22].tx;
  return self;
}

- (BOOL)isPDFCanvasForAnalytics
{
  return self->_isPDFCanvasForAnalytics;
}

- (void)setMetalView:(id)a3
{
  objc_storeStrong((id *)&self->_metalView, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (void)setShouldPause:(BOOL)a3
{
  self->_shouldPause = a3;
}

- (BOOL)usePrivateResourceHandler
{
  return self->_usePrivateResourceHandler;
}

- (void)setUsePrivateResourceHandler:(BOOL)a3
{
  self->_usePrivateResourceHandler = a3;
}

- (BOOL)singleComponent
{
  return self->_singleComponent;
}

- (void)setSingleComponent:(BOOL)a3
{
  self->_singleComponent = a3;
}

- (PKMetalFramebuffer)snapshotFramebuffer
{
  return self->_snapshotFramebuffer;
}

- (void)setSnapshotFramebuffer:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotFramebuffer, a3);
}

- (int64_t)maxNumPredictionPoints
{
  return self->_maxNumPredictionPoints;
}

- (void)setMaxNumPredictionPoints:(int64_t)a3
{
  self->_maxNumPredictionPoints = a3;
}

- (double)drawingStartTimestamp
{
  return self->_drawingStartTimestamp;
}

- (void)setDrawingStartTimestamp:(double)a3
{
  self->_drawingStartTimestamp = a3;
}

- (PKDrawingPowerSavingController)powerSavingController
{
  return self->_powerSavingController;
}

- (void)setPowerSavingController:(id)a3
{
  objc_storeStrong((id *)&self->_powerSavingController, a3);
}

- (CGPoint)_oldEraseLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->__oldEraseLocation.x;
  y = self->__oldEraseLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_oldEraseLocation:(CGPoint)a3
{
  self->__oldEraseLocation = a3;
}

- (NSMutableArray)strokesToErase
{
  return self->_strokesToErase;
}

- (void)setStrokesToErase:(id)a3
{
  objc_storeStrong((id *)&self->_strokesToErase, a3);
}

- (NSMutableSet)strokeIDsToErase
{
  return self->_strokeIDsToErase;
}

- (void)setStrokeIDsToErase:(id)a3
{
  objc_storeStrong((id *)&self->_strokeIDsToErase, a3);
}

- (NSMutableArray)particlesToDestinationAnimations
{
  return self->_particlesToDestinationAnimations;
}

- (void)setParticlesToDestinationAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_particlesToDestinationAnimations, a3);
}

- (NSMutableArray)transformStrokesAnimations
{
  return self->_transformStrokesAnimations;
}

- (void)setTransformStrokesAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_transformStrokesAnimations, a3);
}

- (double)liveAnimationStartTime
{
  return self->_liveAnimationStartTime;
}

- (NSMutableArray)fadeOutStrokeAnimations
{
  return self->_fadeOutStrokeAnimations;
}

- (void)setFadeOutStrokeAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_fadeOutStrokeAnimations, a3);
}

- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation
{
  return self->_alternativeStrokesAnimation;
}

- (void)setAlternativeStrokesAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, a3);
}

- (NSMutableSet)strokeUUIDsAboutToBeRemoved
{
  return self->_strokeUUIDsAboutToBeRemoved;
}

- (void)setStrokeUUIDsAboutToBeRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_strokeUUIDsAboutToBeRemoved, a3);
}

- (NSMutableArray)strokeRenderCachesToPurge
{
  return self->_strokeRenderCachesToPurge;
}

- (void)setStrokeRenderCachesToPurge:(id)a3
{
  objc_storeStrong((id *)&self->_strokeRenderCachesToPurge, a3);
}

- (PKInterpolateColorAnimation)liveRenderingOverrideColorAnimation
{
  return self->_liveRenderingOverrideColorAnimation;
}

- (void)setLiveRenderingOverrideColorAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_liveRenderingOverrideColorAnimation, a3);
}

- (PKShapeDrawingController)shapeDrawingController
{
  return self->_shapeDrawingController;
}

- (void)setShapeDrawingController:(id)a3
{
  objc_storeStrong((id *)&self->_shapeDrawingController, a3);
}

- (PKScratchOutController)scratchOutController
{
  return self->_scratchOutController;
}

- (void)setScratchOutController:(id)a3
{
  objc_storeStrong((id *)&self->_scratchOutController, a3);
}

- (PKInk)sixChannelInk
{
  return self->_sixChannelInk;
}

- (void)setSixChannelInk:(id)a3
{
  objc_storeStrong((id *)&self->_sixChannelInk, a3);
}

- (BOOL)isScratchOutPending
{
  return self->_isScratchOutPending;
}

- (void)setIsScratchOutPending:(BOOL)a3
{
  self->_isScratchOutPending = a3;
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (UIGestureRecognizer)allowSimultaneousGR
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_allowSimultaneousGR);
}

- (void)setAllowSimultaneousGR:(id)a3
{
  objc_storeWeak((id *)&self->_allowSimultaneousGR, a3);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_destroyWeak((id *)&self->_allowSimultaneousGR);
  objc_storeStrong((id *)&self->_sixChannelInk, 0);
  objc_storeStrong((id *)&self->_scratchOutController, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);
  objc_storeStrong((id *)&self->_liveRenderingOverrideColorAnimation, 0);
  objc_storeStrong((id *)&self->_strokeRenderCachesToPurge, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsAboutToBeRemoved, 0);
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, 0);
  objc_storeStrong((id *)&self->_fadeOutStrokeAnimations, 0);
  objc_storeStrong((id *)&self->_transformStrokesAnimations, 0);
  objc_storeStrong((id *)&self->_particlesToDestinationAnimations, 0);
  objc_storeStrong((id *)&self->_strokeIDsToErase, 0);
  objc_storeStrong((id *)&self->_strokesToErase, 0);
  objc_storeStrong(&self->_purgeResourcesBlock, 0);
  objc_storeStrong((id *)&self->_powerSavingController, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_destroyWeak((id *)&self->_currentDrawingBeingCopiedToCanvas);
  objc_storeStrong((id *)&self->_metalConfig, 0);
  objc_destroyWeak((id *)&self->_rulerController);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_liveRenderingOverrideColor, 0);
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_drawingController, 0);
  objc_storeStrong((id *)&self->_fallbackStrokeGenerator, 0);
  objc_storeStrong((id *)&self->_combineStrokesDrawingID, 0);
  objc_storeStrong((id *)&self->_combineStrokesRenderGroupID, 0);
  objc_storeStrong(&self->_combineTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_snapshotFramebuffer, 0);
  objc_storeStrong((id *)&self->_canvasBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentStrokeTouch, 0);
  objc_storeStrong((id *)&self->_finishedStrokes, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  begin = self->_rollPointsToUpdate.__begin_;
  if (begin)
  {
    self->_rollPointsToUpdate.__end_ = begin;
    operator delete(begin);
  }
}

@end
