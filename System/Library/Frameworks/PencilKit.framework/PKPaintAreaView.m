@implementation PKPaintAreaView

- (PKPaintAreaView)initWithCoder:(id)a3
{
  id v4;
  PKPaintAreaView *v5;
  PKPaintAreaView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaintAreaView;
  v5 = -[PKPaintAreaView initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
    -[PKPaintAreaView _commonInit](v5, "_commonInit");

  return v6;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *liveSurfaces;
  void *v5;
  void *v6;
  PKTool *v7;
  PKTool *tool;
  PKDrawingGestureRecognizer *v9;
  PKDrawingGestureRecognizer *drawingGestureRecognizer;
  PKShapeDrawingController *v11;
  PKShapeDrawingController *shapeDrawingController;
  PKShapeDrawingController *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  liveSurfaces = self->_liveSurfaces;
  self->_liveSurfaces = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", CFSTR("com.apple.ink.pen"), v5, 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTool _toolWithInk:](PKTool, "_toolWithInk:", v6);
  v7 = (PKTool *)objc_claimAutoreleasedReturnValue();
  tool = self->_tool;
  self->_tool = v7;

  v9 = objc_alloc_init(PKDrawingGestureRecognizer);
  drawingGestureRecognizer = self->_drawingGestureRecognizer;
  self->_drawingGestureRecognizer = v9;

  -[PKDrawingGestureRecognizer setDelegate:](self->_drawingGestureRecognizer, "setDelegate:", self);
  -[PKDrawingGestureRecognizer setDrawingTarget:](self->_drawingGestureRecognizer, "setDrawingTarget:", self);
  -[PKPaintAreaView addGestureRecognizer:](self, "addGestureRecognizer:", self->_drawingGestureRecognizer);
  v11 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], self);
  shapeDrawingController = self->_shapeDrawingController;
  self->_shapeDrawingController = v11;

  v13 = self->_shapeDrawingController;
  if (v13)
    v13->_shapeRecognitionOn = 1;
}

- (PKPaintAreaView)initWithFrame:(CGRect)a3
{
  PKPaintAreaView *v3;
  PKPaintAreaView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaintAreaView;
  v3 = -[PKPaintAreaView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKPaintAreaView _commonInit](v3, "_commonInit");
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  char v9;
  int v10;
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  PKPaintAreaView *v12;
  PKPaintAreaView *v13;
  PKPaintAreaView *v14;
  void *v16;
  PKPaintAreaViewSurface *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  objc_super v21;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[PKPaintAreaView drawingDisabled](self, "drawingDisabled");
  if (v7)
    v9 = v8;
  else
    v9 = 1;
  if ((v9 & 1) != 0)
    goto LABEL_16;
  if (!objc_msgSend(v7, "_hidEvent"))
    goto LABEL_16;
  v10 = objc_msgSend(v7, "PK_isEventFromPencil");
  if (((-[PKPaintAreaView fingerDrawingEnabled](self, "fingerDrawingEnabled") | v10) & 1) == 0)
    goto LABEL_16;
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  if (!currentPaintSurfaceObject
    || !-[PKPaintAreaViewSurface isDrawing](currentPaintSurfaceObject, "isDrawing")
    && !-[PKPaintAreaViewSurface isErasingObjects](self->_currentPaintSurfaceObject, "isErasingObjects"))
  {
    if (-[PKPaintAreaView canAddStroke](self, "canAddStroke"))
    {
      v21.receiver = self;
      v21.super_class = (Class)PKPaintAreaView;
      -[PKPaintAreaView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
      v13 = (PKPaintAreaView *)objc_claimAutoreleasedReturnValue();
      if (v13 != self)
      {
LABEL_13:
        v14 = v13;
LABEL_14:
        self = v14;
        v12 = v14;
LABEL_15:

        goto LABEL_17;
      }
      if (-[PKPaintAreaViewSurface isDrawing](self->_currentPaintSurfaceObject, "isDrawing"))
      {
        v14 = self;
        goto LABEL_14;
      }
      -[PKPaintAreaView hitSurface:](self, "hitSurface:", x, y);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_currentPaintSurfaceObject;
      if (v17
        && ((v18 = -[PKPaintAreaViewSurface waitingForStrokeToEnd](v17, "waitingForStrokeToEnd"), v16)
          ? (v19 = v18)
          : (v19 = 0),
            v19))
      {
        -[PKPaintAreaViewSurface surface](self->_currentPaintSurfaceObject, "surface");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v20)
        {

          v12 = 0;
          goto LABEL_15;
        }
      }
      else if (!v16)
      {

        self = 0;
        goto LABEL_30;
      }
      -[PKPaintAreaView switchToNewPaintSurface:](self, "switchToNewPaintSurface:", v16);
LABEL_30:

      v13 = self;
      goto LABEL_13;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v12 = self;
LABEL_17:

  return v12;
}

- (CGAffineTransform)strokeTransform
{
  CGAffineTransform *result;
  uint64_t v4;
  __int128 v5;

  result = (CGAffineTransform *)self->_currentPaintSurfaceObject;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform strokeTransform](result, "strokeTransform");
  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

- (BOOL)canAddStroke
{
  return 1;
}

- (void)switchToNewPaintSurface:(id)a3
{
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  _BYTE *v5;
  char v6;
  PKPaintAreaViewSurface *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  PKPaintAreaViewSurface *v12;
  PKPaintAreaViewSurface *v13;
  id v14;

  v14 = a3;
  if (-[PKPaintAreaViewSurface isDrawing](self->_currentPaintSurfaceObject, "isDrawing"))
    -[PKPaintAreaViewSurface drawingEndedWithDetectedShape:completionBlock:](self->_currentPaintSurfaceObject, "drawingEndedWithDetectedShape:completionBlock:", 0, 0);
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  if (currentPaintSurfaceObject)
  {
    -[PKPaintAreaViewSurface drawingController](currentPaintSurfaceObject, "drawingController");
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5[48];

      if ((v6 & 1) == 0)
        goto LABEL_8;
      -[NSMutableArray addObject:](self->_liveSurfaces, "addObject:", self->_currentPaintSurfaceObject);
      v7 = self->_currentPaintSurfaceObject;
      self->_currentPaintSurfaceObject = 0;
    }
    else
    {
      v7 = 0;
    }

  }
LABEL_8:
  -[PKPaintAreaView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PKPaintAreaView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paintAreaView:dispatchQueueForSurface:", self, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[PKPaintAreaViewSurface initWithPaintSurface:dispatchQueue:device:]([PKPaintAreaViewSurface alloc], "initWithPaintSurface:dispatchQueue:device:", v14, v11, self->_device);
  v13 = self->_currentPaintSurfaceObject;
  self->_currentPaintSurfaceObject = v12;

  -[PKPaintAreaViewSurface setPaintAreaView:](self->_currentPaintSurfaceObject, "setPaintAreaView:", self);
}

- (id)hitSurface:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[PKPaintAreaView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paintAreaView:surfaceAtLocation:", self, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", 0, a3.x, a3.y, NAN, NAN);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3 previousPoint:(CGPoint)a4 newSurface:(id *)a5
{
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self->_currentPaintSurfaceObject)
  {
    v8 = a4.y;
    v9 = a4.x;
    -[PKPaintAreaView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaintAreaViewSurface surface](self->_currentPaintSurfaceObject, "surface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paintAreaView:transformLocation:surface:newSurface:", self, v12, a5, x, y);
    x = v13;
    y = v14;

    if (a5 && *a5)
    {
      v9 = NAN;
      v8 = NAN;
    }
    if ((*(_QWORD *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(_QWORD *)&v8 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
      v18 = v9 - x >= 0.0 ? v9 - x : -(v9 - x);
      -[PKPaintAreaViewSurface drawingSize](self->_currentPaintSurfaceObject, "drawingSize");
      if (v18 > v19 * 0.5
        || (v8 - y >= 0.0 ? (v20 = v8 - y) : (v20 = -(v8 - y)),
            -[PKPaintAreaViewSurface drawingSize](self->_currentPaintSurfaceObject, "drawingSize"),
            v20 > v21 * 0.5))
      {
        y = NAN;
        x = NAN;
      }
    }
  }
  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)_isLiveAnimating
{
  double v2;

  -[PKPaintAreaView liveAnimationStartTime](self, "liveAnimationStartTime");
  return v2 > 0.0;
}

- (id)_drawingController
{
  return -[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController");
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

- (id)_rendererController
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  -[PKPaintAreaView _drawingController](self, "_drawingController");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[8];
  v4 = v2;

  return v4;
}

- (void)checkAnimationsDidEndAtTime:(double)a3
{
  double v5;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  double crossFadeStartTime;

  -[PKPaintAreaView liveAnimationStartTime](self, "liveAnimationStartTime");
  if (v5 != 0.0)
  {
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
  }
}

- (void)vsync:(double)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKAlternativeStrokesAnimation *alternativeStrokesAnimation;
  PKAlternativeStrokesAnimation *v13;
  PKAlternativeStrokesAnimation *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  BOOL v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = CACurrentMediaTime();
  if (-[PKPaintAreaView _isLiveAnimating](self, "_isLiveAnimating"))
  {
    -[PKPaintAreaView liveAnimationStartTime](self, "liveAnimationStartTime");
    v7 = v6;
    -[PKPaintAreaView _rendererController](self, "_rendererController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController setLiveStrokeElapsedTime:]((uint64_t)v8, v5 - v7);

  }
  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    -[PKShapeDrawingController _checkDetectedStroke](v9);

  if (self->_alternativeStrokesAnimation)
  {
    -[PKPaintAreaView _rendererController](self, "_rendererController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
      alternativeStrokesAnimation = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_strokes;
    v13 = alternativeStrokesAnimation;
    v14 = self->_alternativeStrokesAnimation;
    v15 = -[PKAlternativeStrokesAnimation alphaAtTime:]((uint64_t)v14, v5);
    v16 = -[PKAlternativeStrokesAnimation originalStrokeAlphaAtTime:]((uint64_t)v14, v5);
    -[PKMetalRendererController setAlternativeStrokes:alpha:originalStrokeAlpha:]((uint64_t)v11, v13, v15, v16);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = (void *)-[NSMutableArray copy](self->_liveSurfaces, "copy", 0);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
        objc_msgSend(v21, "drawingController");
        v22 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        if (v22 && (v23 = (v22[48] & 1) == 0, v22, !v23))
          objc_msgSend(v21, "vsync:", a3);
        else
          -[NSMutableArray removeObject:](self->_liveSurfaces, "removeObject:", v21);
        ++v20;
      }
      while (v18 != v20);
      v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v18 = v24;
    }
    while (v24);
  }

  -[PKPaintAreaViewSurface vsync:](self->_currentPaintSurfaceObject, "vsync:", a3);
  -[PKPaintAreaView checkAnimationsDidEndAtTime:](self, "checkAnimationsDidEndAtTime:", v5);
}

- (void)_drawingBegan:(id *)a3 locationInView:(CGPoint)a4 inputType:(int64_t)a5
{
  double y;
  double x;
  unint64_t v10;
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  uint64_t v12;
  uint64_t v13;
  PKPaintAreaViewSurface *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  int v22;
  void *v23;
  _OWORD v24[8];

  y = a4.y;
  x = a4.x;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v10 = -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties");
    currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
    if (!currentPaintSurfaceObject)
    {
      -[PKDrawingGestureRecognizer cancel](self->_drawingGestureRecognizer, "cancel");
      return;
    }
    -[PKPaintAreaViewSurface setPreviousPoint:](currentPaintSurfaceObject, "setPreviousPoint:", NAN, NAN);
    -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", x, y);
    if ((v13 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL || (v12 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    {
      -[PKDrawingGestureRecognizer end](self->_drawingGestureRecognizer, "end");
      return;
    }
    -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:");
    v14 = self->_currentPaintSurfaceObject;
    v15 = *(_OWORD *)&a3->var9;
    v24[4] = *(_OWORD *)&a3->var7;
    v24[5] = v15;
    v16 = *(_OWORD *)&a3->var13;
    v24[6] = *(_OWORD *)&a3->var11;
    v24[7] = v16;
    v17 = *(_OWORD *)&a3->var1;
    v24[0] = a3->var0;
    v24[1] = v17;
    v18 = *(_OWORD *)&a3->var5;
    v24[2] = *(_OWORD *)&a3->var3;
    v24[3] = v18;
    -[PKPaintAreaViewSurface drawingBegan:activeInputProperties:inputType:](v14, "drawingBegan:activeInputProperties:inputType:", v24, v10, a5);
    -[PKPaintAreaView tool](self, "tool");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "_isStrokeGeneratingInk") || (objc_msgSend(v20, "_isHandwritingInk") & 1) != 0)
      goto LABEL_15;
    -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
    v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (v21[184])
      {

      }
      else
      {
        v22 = v21[185];

        if (!v22)
        {
LABEL_15:

          return;
        }
      }
      -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKShapeDrawingController beginStrokeAtPoint:]((uint64_t)v23, x, y);
    }
    else
    {
      v23 = 0;
    }

    goto LABEL_15;
  }
}

- (BOOL)beginDrawingAtPoint:(id *)a3 surface:(id)a4 locationInView:(CGPoint)a5 inputType:(int64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[8];

  y = a5.y;
  x = a5.x;
  v11 = a4;
  -[PKPaintAreaViewSurface surface](self->_currentPaintSurfaceObject, "surface");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v11)
    -[PKPaintAreaView switchToNewPaintSurface:](self, "switchToNewPaintSurface:", v11);
  v13 = *(_OWORD *)&a3->var9;
  v18[4] = *(_OWORD *)&a3->var7;
  v18[5] = v13;
  v14 = *(_OWORD *)&a3->var13;
  v18[6] = *(_OWORD *)&a3->var11;
  v18[7] = v14;
  v15 = *(_OWORD *)&a3->var1;
  v18[0] = a3->var0;
  v18[1] = v15;
  v16 = *(_OWORD *)&a3->var5;
  v18[2] = *(_OWORD *)&a3->var3;
  v18[3] = v16;
  -[PKPaintAreaView _drawingBegan:locationInView:inputType:](self, "_drawingBegan:locationInView:inputType:", v18, a6, x, y);

  return 1;
}

- (void)drawingMovedToPoint:(id *)a3 locationInView:(CGPoint)a4
{
  _BOOL4 v6;
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  _QWORD *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  v6 = -[PKPaintAreaViewSurface isErasingObjects](self->_currentPaintSurfaceObject, "isErasingObjects", a4.x, a4.y);
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  if (v6)
  {
    -[PKPaintAreaViewSurface eraserMovedToLocation:](currentPaintSurfaceObject, "eraserMovedToLocation:", a3->var0.var0.x, a3->var0.var0.y);
  }
  else
  {
    -[PKPaintAreaViewSurface drawingController](currentPaintSurfaceObject, "drawingController");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKController inputController](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)&a3->var9;
    v14[4] = *(_OWORD *)&a3->var7;
    v14[5] = v10;
    v11 = *(_OWORD *)&a3->var13;
    v14[6] = *(_OWORD *)&a3->var11;
    v14[7] = v11;
    v12 = *(_OWORD *)&a3->var1;
    v14[0] = a3->var0;
    v14[1] = v12;
    v13 = *(_OWORD *)&a3->var5;
    v14[2] = *(_OWORD *)&a3->var3;
    v14[3] = v13;
    objc_msgSend(v9, "addPoint:", v14);

  }
}

- (void)drawingEnded
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  _QWORD v9[5];

  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 200);
  else
    v5 = 0;
  v6 = v5;

  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController resetStroke]((uint64_t)v7);

  -[PKPaintAreaView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", v6 != 0);
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__PKPaintAreaView_drawingEnded__block_invoke;
  v9[3] = &unk_1E7776F38;
  v9[4] = self;
  -[PKPaintAreaViewSurface drawingEndedWithDetectedShape:completionBlock:](currentPaintSurfaceObject, "drawingEndedWithDetectedShape:completionBlock:", v6, v9);

}

void __31__PKPaintAreaView_drawingEnded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 424);
  *(_QWORD *)(v1 + 424) = 0;

}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  return self->_alternativeStrokesAnimation == 0;
}

- (void)drawingBegan:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  _OWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  objc_msgSend(v4, "preciseLocationInView:", self);
  v6 = v5;
  v8 = v7;
  -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v4, 0, -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties"), v9, v10);
  v11 = objc_msgSend(v4, "type") == 2;
  v12[4] = v17;
  v12[5] = v18;
  v12[6] = v19;
  v12[7] = v20;
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  v12[3] = v16;
  -[PKPaintAreaView _drawingBegan:locationInView:inputType:](self, "_drawingBegan:locationInView:inputType:", v12, v11, v6, v8);

}

- (void)drawingMoved:(id)a3 withEvent:(id)a4
{
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  void *v31;
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
  id v42;
  void *v43;
  _QWORD *v44;
  void *v45;
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char *v56;
  PKPaintAreaViewSurface *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  char *v78;
  _QWORD *v79;
  BOOL v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  char *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char *v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  char *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  char *v128;
  char *v130;
  _QWORD *v131;
  void *v132;
  unint64_t *v133;
  void *v134;
  _BOOL8 v135;
  unint64_t v136;
  id v137;
  id v138;
  uint64_t v139;
  id *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _OWORD v150[8];
  _OWORD v151[8];
  _OWORD v152[8];
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  void *__p;
  void *v162;
  uint64_t v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  void *v169;
  char *v170;
  unint64_t v171;
  id v172;
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v138 = a3;
  v137 = a4;
  v6 = -[PKPaintAreaView switchSurfacesDuringStrokes](self, "switchSurfacesDuringStrokes");
  if (-[PKPaintAreaViewSurface isErasingObjects](self->_currentPaintSurfaceObject, "isErasingObjects"))
  {
    objc_msgSend(v138, "preciseLocationInView:", self);
    v8 = v7;
    v10 = v9;
    -[PKPaintAreaViewSurface previousPoint](self->_currentPaintSurfaceObject, "previousPoint");
    if (v6)
      v13 = &v172;
    else
      v13 = 0;
    if (v6)
      v172 = 0;
    -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", v13, v8, v10, v11, v12);
    v15 = v14;
    v17 = v16;
    if (v6 && (v18 = v172) != 0)
    {
      v19 = v18;
      -[PKPaintAreaView switchToNewPaintSurface:](self, "switchToNewPaintSurface:", v18);
      v20 = v19;
    }
    else
    {
      -[PKPaintAreaViewSurface eraserMovedToLocation:](self->_currentPaintSurfaceObject, "eraserMovedToLocation:", v15, v17);
      v20 = 0;
    }
    goto LABEL_112;
  }
  objc_msgSend(v137, "coalescedTouchesForTouch:", v138);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  objc_msgSend(v137, "predictedTouchesForTouch:", v138);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((unint64_t)objc_msgSend(v23, "count") >= 3)
    {
      objc_msgSend(v24, "subarrayWithRange:", 0, 2);
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    v22 += objc_msgSend(v24, "count");
  }
  v134 = v24;
  v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22);
  v170 = 0;
  v169 = 0;
  v171 = 0;
  std::vector<PKInputPoint>::reserve(&v169, v22);
  v26 = -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties");
  v167 = 0u;
  v168 = 0u;
  v135 = objc_msgSend(v138, "type") == 2;
  v165 = 0u;
  v166 = 0u;
  objc_msgSend(v137, "coalescedTouchesForTouch:", v138);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v136 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
  if (v28)
  {
    v29 = &v164;
    if (!v6)
      v29 = 0;
    v140 = v29;
    v141 = *(_QWORD *)v166;
    v133 = &v171;
LABEL_18:
    v139 = v28;
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v166 != v141)
        objc_enumerationMutation(v27);
      v31 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v30);
      objc_msgSend(v31, "preciseLocationInView:", self, v133);
      v33 = v32;
      v35 = v34;
      -[PKPaintAreaViewSurface previousPoint](self->_currentPaintSurfaceObject, "previousPoint");
      if (v6)
        v164 = 0;
      -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", v140, v33, v35, v36, v37);
      v39 = v38;
      v41 = v40;
      if (v6)
      {
        v42 = v164;
        if (v42)
        {
          v43 = v42;
          if (v170 != v169)
          {
            -[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController");
            v44 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            -[PKController inputController](v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = 0;
            __p = 0;
            v163 = 0;
            std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, v169, (uint64_t)v170, (v170 - (_BYTE *)v169) >> 7);
            objc_msgSend(v45, "addPoints:", &__p);
            if (__p)
            {
              v162 = __p;
              operator delete(__p);
            }

            std::vector<PKInputPoint>::resize((uint64_t)&v169, 0);
          }
          -[PKPaintAreaView switchToNewPaintSurface:](self, "switchToNewPaintSurface:", v43);
          if ((*(_QWORD *)&v39 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
            && (*(_QWORD *)&v41 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            v159 = 0u;
            v160 = 0u;
            v157 = 0u;
            v158 = 0u;
            v155 = 0u;
            v156 = 0u;
            v153 = 0u;
            v154 = 0u;
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, v136, v39, v41);
            currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
            v152[4] = v157;
            v152[5] = v158;
            v152[6] = v159;
            v152[7] = v160;
            v152[0] = v153;
            v152[1] = v154;
            v152[2] = v155;
            v152[3] = v156;
            -[PKPaintAreaViewSurface drawingBegan:activeInputProperties:inputType:](currentPaintSurfaceObject, "drawingBegan:activeInputProperties:inputType:", v152, v136, v135);
          }
          goto LABEL_65;
        }
      }
      if ((*(_QWORD *)&v39 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
        || (*(_QWORD *)&v41 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        if (-[PKPaintAreaViewSurface isDrawing](self->_currentPaintSurfaceObject, "isDrawing"))
          -[PKPaintAreaViewSurface drawingEndedWithDetectedShape:completionBlock:](self->_currentPaintSurfaceObject, "drawingEndedWithDetectedShape:completionBlock:", 0, 0);
        -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:", NAN, NAN);
        goto LABEL_105;
      }
      if (-[PKPaintAreaViewSurface isDrawing](self->_currentPaintSurfaceObject, "isDrawing"))
      {
        -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:", v39, v41);
        v159 = 0u;
        v160 = 0u;
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties"), v39, v41);
        v49 = v170;
        if ((unint64_t)v170 >= v171)
        {
          v58 = (char *)v169;
          v59 = (v170 - (_BYTE *)v169) >> 7;
          v60 = v59 + 1;
          if ((unint64_t)(v59 + 1) >> 57)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v61 = v171 - (_QWORD)v169;
          if ((uint64_t)(v171 - (_QWORD)v169) >> 6 > v60)
            v60 = v61 >> 6;
          if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFF80)
            v62 = 0x1FFFFFFFFFFFFFFLL;
          else
            v62 = v60;
          if (v62)
          {
            v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)v133, v62);
            v49 = v170;
            v58 = (char *)v169;
          }
          else
          {
            v63 = 0;
          }
          v64 = &v63[128 * v59];
          v65 = v153;
          v66 = v154;
          v67 = v156;
          *((_OWORD *)v64 + 2) = v155;
          *((_OWORD *)v64 + 3) = v67;
          *(_OWORD *)v64 = v65;
          *((_OWORD *)v64 + 1) = v66;
          v68 = v157;
          v69 = v158;
          v70 = v160;
          *((_OWORD *)v64 + 6) = v159;
          *((_OWORD *)v64 + 7) = v70;
          *((_OWORD *)v64 + 4) = v68;
          *((_OWORD *)v64 + 5) = v69;
          if (v49 == v58)
          {
            v78 = &v63[128 * v59];
          }
          else
          {
            v71 = &v63[128 * v59];
            do
            {
              v72 = *((_OWORD *)v49 - 8);
              v73 = *((_OWORD *)v49 - 7);
              v74 = *((_OWORD *)v49 - 5);
              *((_OWORD *)v71 - 6) = *((_OWORD *)v49 - 6);
              *((_OWORD *)v71 - 5) = v74;
              *((_OWORD *)v71 - 8) = v72;
              *((_OWORD *)v71 - 7) = v73;
              v75 = *((_OWORD *)v49 - 4);
              v76 = *((_OWORD *)v49 - 3);
              v77 = *((_OWORD *)v49 - 1);
              v78 = v71 - 128;
              *((_OWORD *)v71 - 2) = *((_OWORD *)v49 - 2);
              *((_OWORD *)v71 - 1) = v77;
              *((_OWORD *)v71 - 4) = v75;
              *((_OWORD *)v71 - 3) = v76;
              v49 -= 128;
              v71 -= 128;
            }
            while (v49 != v58);
          }
          v56 = v64 + 128;
          v169 = v78;
          v170 = v64 + 128;
          v171 = (unint64_t)&v63[128 * v62];
          if (v58)
            operator delete(v58);
        }
        else
        {
          v50 = v153;
          v51 = v154;
          v52 = v156;
          *((_OWORD *)v170 + 2) = v155;
          *((_OWORD *)v49 + 3) = v52;
          *(_OWORD *)v49 = v50;
          *((_OWORD *)v49 + 1) = v51;
          v53 = v157;
          v54 = v158;
          v55 = v160;
          *((_OWORD *)v49 + 6) = v159;
          *((_OWORD *)v49 + 7) = v55;
          *((_OWORD *)v49 + 4) = v53;
          *((_OWORD *)v49 + 5) = v54;
          v56 = v49 + 128;
        }
        v170 = v56;
        objc_msgSend(v142, "addObject:", v31);
        -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
        v79 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (!v79)
        {
          v86 = 0;
          goto LABEL_63;
        }
        v80 = v79[2] == v79[1];

        if (!v80)
        {
          -[PKPaintAreaView window](self, "window");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "locationInView:", v81);
          v83 = v82;
          v85 = v84;

          -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v150[5] = v158;
          v150[6] = v159;
          v150[7] = v160;
          v150[0] = v153;
          v150[1] = v154;
          v150[2] = v155;
          v150[3] = v156;
          v150[4] = v157;
          -[PKShapeDrawingController addStrokePoint:inputPoint:]((uint64_t)v86, v150, v83, v85);
LABEL_63:

        }
      }
      else
      {
        v159 = 0u;
        v160 = 0u;
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, v136, v39, v41);
        v57 = self->_currentPaintSurfaceObject;
        v151[4] = v157;
        v151[5] = v158;
        v151[6] = v159;
        v151[7] = v160;
        v151[0] = v153;
        v151[1] = v154;
        v151[2] = v155;
        v151[3] = v156;
        -[PKPaintAreaViewSurface drawingBegan:activeInputProperties:inputType:](v57, "drawingBegan:activeInputProperties:inputType:", v151, v136, v135);
      }
      v43 = 0;
LABEL_65:

      if (++v30 == v139)
      {
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v165, v174, 16);
        if (v28)
          goto LABEL_18;
        break;
      }
    }
  }

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v27 = v134;
  v87 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v146, v173, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v147;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v147 != v88)
          objc_enumerationMutation(v27);
        v90 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
        objc_msgSend(v90, "preciseLocationInView:", self);
        v92 = v91;
        v94 = v93;
        -[PKPaintAreaViewSurface previousPoint](self->_currentPaintSurfaceObject, "previousPoint");
        -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", 0, v92, v94, v95, v96);
        if ((*(_QWORD *)&v97 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*(_QWORD *)&v98 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v159 = 0u;
          v160 = 0u;
          v157 = 0u;
          v158 = 0u;
          v155 = 0u;
          v156 = 0u;
          v153 = 0u;
          v154 = 0u;
          +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v90, 1, -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties"), v97, v98);
          v100 = v170;
          if ((unint64_t)v170 >= v171)
          {
            v108 = (char *)v169;
            v109 = (v170 - (_BYTE *)v169) >> 7;
            v110 = v109 + 1;
            if ((unint64_t)(v109 + 1) >> 57)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v111 = v171 - (_QWORD)v169;
            if ((uint64_t)(v171 - (_QWORD)v169) >> 6 > v110)
              v110 = v111 >> 6;
            if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFF80)
              v112 = 0x1FFFFFFFFFFFFFFLL;
            else
              v112 = v110;
            if (v112)
            {
              v113 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v171, v112);
              v100 = v170;
              v108 = (char *)v169;
            }
            else
            {
              v113 = 0;
            }
            v114 = &v113[128 * v109];
            v115 = v153;
            v116 = v154;
            v117 = v156;
            *((_OWORD *)v114 + 2) = v155;
            *((_OWORD *)v114 + 3) = v117;
            *(_OWORD *)v114 = v115;
            *((_OWORD *)v114 + 1) = v116;
            v118 = v157;
            v119 = v158;
            v120 = v160;
            *((_OWORD *)v114 + 6) = v159;
            *((_OWORD *)v114 + 7) = v120;
            *((_OWORD *)v114 + 4) = v118;
            *((_OWORD *)v114 + 5) = v119;
            if (v100 == v108)
            {
              v128 = &v113[128 * v109];
            }
            else
            {
              v121 = &v113[128 * v109];
              do
              {
                v122 = *((_OWORD *)v100 - 8);
                v123 = *((_OWORD *)v100 - 7);
                v124 = *((_OWORD *)v100 - 5);
                *((_OWORD *)v121 - 6) = *((_OWORD *)v100 - 6);
                *((_OWORD *)v121 - 5) = v124;
                *((_OWORD *)v121 - 8) = v122;
                *((_OWORD *)v121 - 7) = v123;
                v125 = *((_OWORD *)v100 - 4);
                v126 = *((_OWORD *)v100 - 3);
                v127 = *((_OWORD *)v100 - 1);
                v128 = v121 - 128;
                *((_OWORD *)v121 - 2) = *((_OWORD *)v100 - 2);
                *((_OWORD *)v121 - 1) = v127;
                *((_OWORD *)v121 - 4) = v125;
                *((_OWORD *)v121 - 3) = v126;
                v100 -= 128;
                v121 -= 128;
              }
              while (v100 != v108);
            }
            v107 = v114 + 128;
            v169 = v128;
            v170 = v114 + 128;
            v171 = (unint64_t)&v113[128 * v112];
            if (v108)
              operator delete(v108);
          }
          else
          {
            v101 = v153;
            v102 = v154;
            v103 = v156;
            *((_OWORD *)v170 + 2) = v155;
            *((_OWORD *)v100 + 3) = v103;
            *(_OWORD *)v100 = v101;
            *((_OWORD *)v100 + 1) = v102;
            v104 = v157;
            v105 = v158;
            v106 = v160;
            *((_OWORD *)v100 + 6) = v159;
            *((_OWORD *)v100 + 7) = v106;
            *((_OWORD *)v100 + 4) = v104;
            *((_OWORD *)v100 + 5) = v105;
            v107 = v100 + 128;
          }
          v170 = v107;
          objc_msgSend(v142, "addObject:", v90);
        }
      }
      v87 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v146, v173, 16);
    }
    while (v87);
  }
LABEL_105:

  v130 = v170;
  if (v170 != v169)
  {
    -[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController");
    v131 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKController inputController](v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    v144 = 0;
    v145 = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&v143, v169, (uint64_t)v170, (v170 - (_BYTE *)v169) >> 7);
    objc_msgSend(v132, "addPoints:", &v143);
    if (v143)
    {
      v144 = v143;
      operator delete(v143);
    }

    v130 = (char *)v169;
  }
  if (v130)
  {
    v170 = v130;
    operator delete(v130);
  }

  v20 = v134;
LABEL_112:

}

- (void)drawingCancelled
{
  PKPaintAreaViewSurface *currentPaintSurfaceObject;
  id v4;
  PKPaintAreaViewSurface *v5;

  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController resetStroke]((uint64_t)v4);

  -[PKPaintAreaView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", 0);
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  self->_currentPaintSurfaceObject = 0;
  v5 = currentPaintSurfaceObject;

  -[PKPaintAreaViewSurface drawingCancelled](v5, "drawingCancelled");
}

- (void)drawingEstimatedPropertiesUpdated:(id)a3
{
  _BYTE *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  _QWORD *v14;
  void *v15;
  id v16;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (-[PKPaintAreaViewSurface isDrawing](self->_currentPaintSurfaceObject, "isDrawing")
    || (-[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController"),
        (v4 = (_BYTE *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = v4[48], v4, (v5 & 1) != 0))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v16;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "preciseLocationInView:", self);
          -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:");
          if ((*(_QWORD *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
            && (*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v10, 0, -[PKDrawingGestureRecognizer activeInputProperties](self->_drawingGestureRecognizer, "activeInputProperties"), v11, v12);
            -[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController");
            v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            -[PKController inputController](v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v17[4] = v22;
            v17[5] = v23;
            v17[6] = v24;
            v17[7] = v25;
            v17[0] = v18;
            v17[1] = v19;
            v17[2] = v20;
            v17[3] = v21;
            objc_msgSend(v15, "drawingUpdatePoint:", v17);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

  }
}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  -[PKPaintAreaViewSurface drawingController](self->_currentPaintSurfaceObject, "drawingController", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[8];
  v5 = v3;

  return v5;
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PKAlternativeStrokesAnimation *v11;
  void *v12;
  id *v13;
  void *v14;
  _QWORD v15[5];
  _OWORD v16[8];

  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    -[PKAveragePointGenerator currentInputPoint](*(_QWORD *)(v6 + 120), (uint64_t)v16);
  else
    memset(v16, 0, sizeof(v16));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PKPaintAreaView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke;
  v15[3] = &unk_1E7778350;
  v15[4] = self;
  -[PKShapeDrawingController detectedShapeWithInputScale:averageInputPoint:allowedShapeTypes:createCurrentStrokeBlock:]((uint64_t)v5, v16, 0, v15, 2.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = CACurrentMediaTime();
    -[PKPaintAreaView liveAnimationStartTime](self, "liveAnimationStartTime");
    if (v10 == 0.0)
      -[PKPaintAreaView setLiveAnimationStartTime:](self, "setLiveAnimationStartTime:", v9);
    v11 = [PKAlternativeStrokesAnimation alloc];
    objc_msgSend(v8, "strokes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKAlternativeStrokesAnimation initWithStrokes:shape:startTime:fadeDuration:]((id *)&v11->super.isa, v12, v8, v9, 0.15);
    -[PKPaintAreaView setAlternativeStrokesAnimation:](self, "setAlternativeStrokesAnimation:", v13);

    -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShapeDrawingController setDetectedShape:]((uint64_t)v14, v8);

  }
}

id __76__PKPaintAreaView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_drawingController");
  v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKController inputController](v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newStrokeWithCurrentData");

  return v3;
}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  void *v4;

  -[PKPaintAreaView shapeDrawingController](self, "shapeDrawingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)v4, 0);

  -[PKPaintAreaView _endAlternativeStrokeIfNecessaryAccepted:](self, "_endAlternativeStrokeIfNecessaryAccepted:", 0);
}

- (PKPaintAreaViewDelegate)delegate
{
  return (PKPaintAreaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)switchSurfacesDuringStrokes
{
  return self->_switchSurfacesDuringStrokes;
}

- (void)setSwitchSurfacesDuringStrokes:(BOOL)a3
{
  self->_switchSurfacesDuringStrokes = a3;
}

- (BOOL)fingerDrawingEnabled
{
  return self->_fingerDrawingEnabled;
}

- (void)setFingerDrawingEnabled:(BOOL)a3
{
  self->_fingerDrawingEnabled = a3;
}

- (BOOL)drawingDisabled
{
  return self->_drawingDisabled;
}

- (void)setDrawingDisabled:(BOOL)a3
{
  self->_drawingDisabled = a3;
}

- (PKTool)tool
{
  return self->_tool;
}

- (void)setTool:(id)a3
{
  objc_storeStrong((id *)&self->_tool, a3);
}

- (PKShapeDrawingController)shapeDrawingController
{
  return self->_shapeDrawingController;
}

- (void)setShapeDrawingController:(id)a3
{
  objc_storeStrong((id *)&self->_shapeDrawingController, a3);
}

- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation
{
  return self->_alternativeStrokesAnimation;
}

- (void)setAlternativeStrokesAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, a3);
}

- (double)liveAnimationStartTime
{
  return self->_liveAnimationStartTime;
}

- (void)setLiveAnimationStartTime:(double)a3
{
  self->_liveAnimationStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);
  objc_storeStrong((id *)&self->_tool, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_liveSurfaces, 0);
  objc_storeStrong((id *)&self->_currentPaintSurfaceObject, 0);
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
}

@end
