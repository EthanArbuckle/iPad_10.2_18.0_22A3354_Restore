@implementation DKInkRendererCG

- (DKInkRendererCG)initWithFrame:(CGRect)a3
{
  DKInkRendererCG *v3;
  DKInkRendererCG *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKInkRendererCG;
  v3 = -[DKInkRendererCG initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DKInkRendererCG _commonInit](v3, "_commonInit");
  return v4;
}

- (DKInkRendererCG)initWithCoder:(id)a3
{
  DKInkRendererCG *v3;
  DKInkRendererCG *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKInkRendererCG;
  v3 = -[DKInkRendererCG initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DKInkRendererCG _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;

  -[DKInkRendererCG setClearsContextBeforeDrawing:](self, "setClearsContextBeforeDrawing:", 0);
  -[DKInkRendererCG setOpaque:](self, "setOpaque:", 1);
  -[DKInkRendererCG setExclusiveTouch:](self, "setExclusiveTouch:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DKInkRendererCG setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DKInkRendererCG;
  -[DKInkRendererCG dealloc](&v2, sel_dealloc);
}

- (void)beginStroke
{
  CGSize v3;
  NSMutableArray *v4;
  NSMutableArray *cachedInterpolatedBrushStrokes;
  NSMutableArray *v6;
  NSMutableArray *currentInterpolatedBrushStroke;

  v3 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_invalidRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_invalidRect.size = v3;
  if (!self->_cachedInterpolatedBrushStrokes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 200);
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
    self->_cachedInterpolatedBrushStrokes = v4;

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2000);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = v6;

}

- (void)addPoint:(id *)a3
{
  __int128 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGRect *p_invalidRect;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[2];
  double var3;
  CGRect v17;
  CGRect v18;

  v5 = *(_OWORD *)&a3->var1;
  v15[0] = a3->var0;
  v15[1] = v5;
  var3 = a3->var3;
  objc_msgSend(MEMORY[0x24BDD1968], "dk_valueWithRenderPoint:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_currentInterpolatedBrushStroke, "addObject:", v6);
  v7 = ClampToMinWidthCG(a3->var1, 1.0);
  v8 = a3->var0.x - v7 * 0.5;
  v9 = a3->var0.y - v7 * 0.5;
  p_invalidRect = &self->_invalidRect;
  if (CGRectIsNull(self->_invalidRect))
  {
    v11 = v7;
  }
  else
  {
    v17.origin.x = p_invalidRect->origin.x;
    v17.origin.y = self->_invalidRect.origin.y;
    v17.size.width = self->_invalidRect.size.width;
    v17.size.height = self->_invalidRect.size.height;
    v18.origin.x = v8;
    v18.origin.y = v9;
    v18.size.width = v7;
    v18.size.height = v7;
    *(CGRect *)(&v11 - 3) = CGRectUnion(v17, v18);
    v8 = v12;
    v9 = v13;
    v7 = v14;
  }
  p_invalidRect->origin.x = v8;
  self->_invalidRect.origin.y = v9;
  self->_invalidRect.size.width = v7;
  self->_invalidRect.size.height = v11;

}

- (void)endStroke
{
  NSMutableArray *currentInterpolatedBrushStroke;

  if (self->_currentInterpolatedBrushStroke)
  {
    -[NSMutableArray addObject:](self->_cachedInterpolatedBrushStrokes, "addObject:");
    currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  }
  else
  {
    currentInterpolatedBrushStroke = 0;
  }
  self->_currentInterpolatedBrushStroke = 0;

}

- (void)clear
{
  NSMutableArray *cachedInterpolatedBrushStrokes;
  NSMutableArray *currentInterpolatedBrushStroke;
  CGSize v5;

  cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
  self->_cachedInterpolatedBrushStrokes = 0;

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = 0;

  v5 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_invalidRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_invalidRect.size = v5;
  -[DKInkRendererCG bounds](self, "bounds");
  -[DKInkRendererCG setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)removeLastStroke
{
  -[NSMutableArray removeLastObject](self->_cachedInterpolatedBrushStrokes, "removeLastObject");
}

- (id)snapshotImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  CGSize v13;

  -[DKInkRendererCG bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v13.width = v7;
  v13.height = v9;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  -[DKInkRendererCG drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v4, v6, v8, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

- (BOOL)supportsBleedAnimation
{
  return 0;
}

- (unint64_t)maximumPointsForBleedAnimation
{
  return 0;
}

- (void)teardown
{
  -[DKInkRendererCG setDelegate:](self, "setDelegate:", 0);
}

- (BOOL)initialized
{
  return 1;
}

- (void)display
{
  CGRect *p_invalidRect;
  CGSize v4;
  id v5;

  p_invalidRect = &self->_invalidRect;
  if (!CGRectIsNull(self->_invalidRect))
  {
    -[DKInkRendererCG setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", p_invalidRect->origin.x, p_invalidRect->origin.y, p_invalidRect->size.width, p_invalidRect->size.height);
    v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    p_invalidRect->origin = (CGPoint)*MEMORY[0x24BDBF070];
    p_invalidRect->size = v4;
    -[DKInkRendererCG delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "performSelector:withObject:", sel_inkDidRender_, self);

  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSMutableArray *currentInterpolatedBrushStroke;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v59 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[DKInkRendererCG inkColor](self, "inkColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v9, "CGColor"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = self->_cachedInterpolatedBrushStrokes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v49 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              v47 = 0;
              v45 = 0u;
              v46 = 0u;
              if (v21)
              {
                objc_msgSend(v21, "dk_renderPointValue");
                v23 = *((double *)&v45 + 1);
                v22 = *(double *)&v45;
                v24 = *(double *)&v46;
              }
              else
              {
                v24 = 0.0;
                v23 = 0.0;
                v22 = 0.0;
              }
              v25 = ClampToMinWidthCG(v24, 1.0);
              v26 = v22 - v25 * 0.5;
              v27 = v23 - v25 * 0.5;
              v60.origin.x = v26;
              v60.origin.y = v27;
              v60.size.width = v25;
              v60.size.height = v25;
              v64.origin.x = x;
              v64.origin.y = y;
              v64.size.width = width;
              v64.size.height = height;
              if (CGRectIntersectsRect(v60, v64))
              {
                v61.origin.x = v26;
                v61.origin.y = v27;
                v61.size.width = v25;
                v61.size.height = v25;
                CGContextFillEllipseInRect(CurrentContext, v61);
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          }
          while (v18);
        }

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v12);
  }

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  if (currentInterpolatedBrushStroke)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = currentInterpolatedBrushStroke;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          v47 = 0;
          v45 = 0u;
          v46 = 0u;
          if (v34)
          {
            objc_msgSend(v34, "dk_renderPointValue", (_QWORD)v41);
            v36 = *((double *)&v45 + 1);
            v35 = *(double *)&v45;
            v37 = *(double *)&v46;
          }
          else
          {
            v37 = 0.0;
            v36 = 0.0;
            v35 = 0.0;
          }
          v38 = ClampToMinWidthCG(v37, 1.0);
          v39 = v35 - v38 * 0.5;
          v40 = v36 - v38 * 0.5;
          v62.origin.x = v39;
          v62.origin.y = v40;
          v62.size.width = v38;
          v62.size.height = v38;
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          if (CGRectIntersectsRect(v62, v65))
          {
            v63.origin.x = v39;
            v63.origin.y = v40;
            v63.size.width = v38;
            v63.size.height = v38;
            CGContextFillEllipseInRect(CurrentContext, v63);
          }
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
      }
      while (v31);
    }

  }
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)inkColor
{
  return self->inkColor;
}

- (void)setInkColor:(id)a3
{
  objc_storeStrong((id *)&self->inkColor, a3);
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
  return self->drawingScale;
}

- (void)setDrawingScale:(double)a3
{
  self->drawingScale = a3;
}

- (unint64_t)mode
{
  return self->mode;
}

- (void)setMode:(unint64_t)a3
{
  self->mode = a3;
}

- (BOOL)drawingEnabled
{
  return self->drawingEnabled;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->drawingEnabled = a3;
}

- (CGRect)invalidRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_invalidRect.origin.x;
  y = self->_invalidRect.origin.y;
  width = self->_invalidRect.size.width;
  height = self->_invalidRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInvalidRect:(CGRect)a3
{
  self->_invalidRect = a3;
}

- (NSMutableArray)cachedInterpolatedBrushStrokes
{
  return self->_cachedInterpolatedBrushStrokes;
}

- (void)setCachedInterpolatedBrushStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, a3);
}

- (NSMutableArray)currentInterpolatedBrushStroke
{
  return self->_currentInterpolatedBrushStroke;
}

- (void)setCurrentInterpolatedBrushStroke:(id)a3
{
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->inkColor, 0);
}

@end
