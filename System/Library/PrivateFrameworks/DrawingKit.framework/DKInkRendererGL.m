@implementation DKInkRendererGL

- (DKInkRendererGL)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  DKInkRendererGL *v9;
  void *v10;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
  v13.receiver = self;
  v13.super_class = (Class)DKInkRendererGL;
  v9 = -[GLKView initWithFrame:context:](&v13, sel_initWithFrame_context_, v8, x, y, width, height);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKInkRendererGL setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[GLKView setDrawableColorFormat:](v9, "setDrawableColorFormat:", 0);
    -[GLKView setDrawableDepthFormat:](v9, "setDrawableDepthFormat:", 0);
    -[GLKView setDrawableStencilFormat:](v9, "setDrawableStencilFormat:", 0);
    -[GLKView setDrawableMultisample:](v9, "setDrawableMultisample:", 0);
    -[GLKView setEnableSetNeedsDisplay:](v9, "setEnableSetNeedsDisplay:", 0);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    -[GLKView setContentScaleFactor:](v9, "setContentScaleFactor:");

    -[DKInkRendererGL _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *brushStrokes;
  NSMutableArray *v5;
  NSMutableArray *brushPointQueue;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  brushStrokes = self->_brushStrokes;
  self->_brushStrokes = v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1000);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  brushPointQueue = self->_brushPointQueue;
  self->_brushPointQueue = v5;

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  DKOpenGLRenderer *inkRenderer;
  void *v6;
  DKOpenGLRenderer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  DKOpenGLRenderer *v18;
  DKOpenGLRenderer *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DKInkRendererGL;
  -[GLKView layoutSubviews](&v20, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  if (self->_initialized
    || (-[DKInkRendererGL window](self, "window"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
    glClear(0x4000u);
    inkRenderer = self->_inkRenderer;
    -[DKInkRendererGL bounds](self, "bounds");
    -[DKOpenGLRenderer setBounds:](inkRenderer, "setBounds:");
  }
  else
  {
    self->_initialized = 1;
    +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
    glEnable(0xBE2u);
    glBlendFunc(0x302u, 0x303u);
    if (!self->_inkRenderer)
    {
      v7 = [DKOpenGLRenderer alloc];
      -[DKInkRendererGL bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      v18 = -[DKOpenGLRenderer initWithBounds:scale:](v7, "initWithBounds:scale:", v9, v11, v13, v15, v17);
      v19 = self->_inkRenderer;
      self->_inkRenderer = v18;

      -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:", self->_inkColor);
      -[DKOpenGLRenderer setLineWidthScale:](self->_inkRenderer, "setLineWidthScale:", self->_drawingScale);
      -[DKOpenGLRenderer setUndoEnabled:](self->_inkRenderer, "setUndoEnabled:", self->_mode == 0);
      -[DKOpenGLRenderer setDelegate:](self->_inkRenderer, "setDelegate:", self);
    }
    glClear(0x4000u);
  }
  -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:", self->_inkColor);
}

- (id)snapshotImage
{
  void *v3;
  objc_super v5;

  if (+[DKGLUtilities gpuAvailable](DKGLUtilities, "gpuAvailable"))
  {
    v5.receiver = self;
    v5.super_class = (Class)DKInkRendererGL;
    -[GLKView snapshot](&v5, sel_snapshot);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  DKOpenGLRenderer *inkRenderer;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[DKInkRendererGL setDelegate:](self, "setDelegate:", 0);
  inkRenderer = self->_inkRenderer;
  self->_inkRenderer = 0;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GLKView context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", 0);
  v8.receiver = self;
  v8.super_class = (Class)DKInkRendererGL;
  -[GLKView dealloc](&v8, sel_dealloc);
}

- (void)beginStroke
{
  NSMutableArray *v3;
  NSMutableArray *currentBrushStroke;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  currentBrushStroke = self->_currentBrushStroke;
  self->_currentBrushStroke = v3;

  -[DKOpenGLRenderer didBeginNewStroke](self->_inkRenderer, "didBeginNewStroke");
}

- (void)addPoint:(id *)a3
{
  __int128 v4;
  void *v5;
  _OWORD v6[2];
  double var3;

  v4 = *(_OWORD *)&a3->var1;
  v6[0] = a3->var0;
  v6[1] = v4;
  var3 = a3->var3;
  objc_msgSend(MEMORY[0x24BDD1968], "dk_valueWithRenderPoint:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_currentBrushStroke, "addObject:", v5);
  -[NSMutableArray addObject:](self->_brushPointQueue, "addObject:", v5);

}

- (void)endStroke
{
  if (self->_currentBrushStroke)
    -[NSMutableArray addObject:](self->_brushStrokes, "addObject:");
  -[DKOpenGLRenderer didCompleteStroke](self->_inkRenderer, "didCompleteStroke");
}

- (void)clear
{
  -[NSMutableArray removeAllObjects](self->_brushPointQueue, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_currentBrushStroke, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_brushStrokes, "removeAllObjects");
}

- (void)resetRendererState
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[DKOpenGLRenderer resetRendererState](self->_inkRenderer, "resetRendererState");
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (void)completeAnimationsImmediately
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[DKOpenGLRenderer updateDryForcefully](self->_inkRenderer, "updateDryForcefully");
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (void)removeLastStroke
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[NSMutableArray removeLastObject](self->_brushStrokes, "removeLastObject");
  -[DKOpenGLRenderer undo](self->_inkRenderer, "undo");
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (void)setInkColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_inkColor, a3);
  v5 = a3;
  -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:");

}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[DKOpenGLRenderer setUndoEnabled:](self->_inkRenderer, "setUndoEnabled:", a3 != 1);
  }
}

- (void)force
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[DKOpenGLRenderer setIgnoreFirstUndoItem:](self->_inkRenderer, "setIgnoreFirstUndoItem:", 1);
  -[DKOpenGLRenderer didBeginNewStroke](self->_inkRenderer, "didBeginNewStroke");
  -[DKInkRendererGL displayForcefully](self, "displayForcefully");
  -[DKOpenGLRenderer didCompleteStroke](self->_inkRenderer, "didCompleteStroke");
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (void)flush
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  glFlush();
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (BOOL)supportsBleedAnimation
{
  return 1;
}

- (unint64_t)maximumPointsForBleedAnimation
{
  return 7000;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
  -[DKOpenGLRenderer setLineWidthScale:](self->_inkRenderer, "setLineWidthScale:");
}

- (void)display
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DKInkRendererGL;
  -[GLKView display](&v4, sel_display);
  if (self->_needToNotify)
  {
    -[DKInkRendererGL delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel_inkDidRender_, self, 0.0);
    self->_needToNotify = 0;

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKInkRendererGL;
  -[DKInkRendererGL traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[DKInkRendererGL traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[DKInkRendererGL force](self, "force");

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6F30];
  -[DKInkRendererGL traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentTraitCollection:", v6);

  +[DKGLUtilities setCurrentClearColor](DKGLUtilities, "setCurrentClearColor");
  -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:", self->_inkColor);
  glClear(0x4000u);
  v7 = -[NSMutableArray count](self->_brushPointQueue, "count");
  -[DKInkRendererGL addPointsFromBrushPointQueueWithSegmentLength:](self, "addPointsFromBrushPointQueueWithSegmentLength:", -[NSMutableArray count](self->_brushPointQueue, "count"));
  -[DKOpenGLRenderer update](self->_inkRenderer, "update");
  -[DKOpenGLRenderer draw](self->_inkRenderer, "draw");
  objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v8);
  if (v7)
    self->_needToNotify = 1;

}

- (void)displayForcefully
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF6F30];
  -[DKInkRendererGL traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentTraitCollection:", v5);

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentContext:", v8);

  -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:", self->_inkColor);
  -[DKOpenGLRenderer setDrawingEnabled:](self->_inkRenderer, "setDrawingEnabled:", 0);
  -[DKInkRendererGL addPointsFromBrushPointQueueWithSegmentLength:](self, "addPointsFromBrushPointQueueWithSegmentLength:", 25);
  -[DKOpenGLRenderer setDrawingEnabled:](self->_inkRenderer, "setDrawingEnabled:", 1);
  -[DKOpenGLRenderer redrawEntireDrawingImmediatelyWithLayeredBlending:](self->_inkRenderer, "redrawEntireDrawingImmediatelyWithLayeredBlending:", 1);
  self->_needToNotify = 1;
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v6);
  objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v9);

}

- (void)addPointsFromBrushPointQueueWithSegmentLength:(unint64_t)a3
{
  DKOpenGLRenderer *inkRenderer;

  if (-[NSMutableArray count](self->_brushPointQueue, "count"))
  {
    inkRenderer = self->_inkRenderer;
    if (inkRenderer)
    {
      -[DKOpenGLRenderer addPoints:withSegmentLength:](inkRenderer, "addPoints:withSegmentLength:", self->_brushPointQueue, a3);
      -[NSMutableArray removeAllObjects](self->_brushPointQueue, "removeAllObjects");
    }
  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDE2818];
  -[GLKView context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentContext:", v4);

  -[DKOpenGLRenderer teardown](self->_inkRenderer, "teardown");
  -[DKInkRendererGL setDelegate:](self, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);

}

- (void)rendererDidFinishAnimatingDrawing:(id)a3
{
  id v4;

  -[DKInkRendererGL delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "inkDidCompleteRender:", self);

}

- (UIColor)inkColor
{
  return self->_inkColor;
}

- (DKInkRendererDelegate)delegate
{
  return (DKInkRendererDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)scaleDrawingToFitCanvas
{
  return self->scaleDrawingToFitCanvas;
}

- (void)setScaleDrawingToFitCanvas:(BOOL)a3
{
  self->scaleDrawingToFitCanvas = a3;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)drawingEnabled
{
  return self->drawingEnabled;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->drawingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_inkRenderer, 0);
  objc_storeStrong((id *)&self->_currentBrushStroke, 0);
  objc_storeStrong((id *)&self->_brushStrokes, 0);
  objc_storeStrong((id *)&self->_brushPointQueue, 0);
  objc_storeStrong((id *)&self->_inkColor, 0);
}

@end
