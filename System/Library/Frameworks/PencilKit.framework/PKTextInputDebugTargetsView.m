@implementation PKTextInputDebugTargetsView

- (PKTextInputDebugTargetsView)initWithFrame:(CGRect)a3
{
  PKTextInputDebugTargetsView *v3;
  void *v4;
  NSArray *visualizationElements;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDebugTargetsView;
  v3 = -[PKTextInputDebugTargetsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugTargetsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKTextInputDebugTargetsView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    visualizationElements = v3->_visualizationElements;
    v3->_visualizationElements = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)setVisualizationElements:(id)a3
{
  NSArray *v4;
  NSArray *visualizationElements;

  if (self->_visualizationElements != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    visualizationElements = self->_visualizationElements;
    self->_visualizationElements = v4;

    self->_dashLinePhase = self->_dashLinePhase + 2.0;
    -[PKTextInputDebugTargetsView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const CGPath *v28;
  id v29;
  const CGPath *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  CGFloat lengths[2];
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PKTextInputDebugTargetsView;
  -[PKTextInputDebugTargetsView drawRect:](&v36, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 0.15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PKTextInputDebugTargetsView visualizationElements](self, "visualizationElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[PKTextInputElement coordinateSpace]((uint64_t)v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = -[PKTextInputElement frame]((uint64_t)v11);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          -[PKTextInputElement coordinateSpace]((uint64_t)v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, self, v13, v15, v17, v19);
          v23 = v22;
          v25 = v24;
          v27 = v26;

          v40.origin.x = v21;
          v40.origin.y = v23;
          v40.size.width = v25;
          v40.size.height = v27;
          v28 = CGPathCreateWithRoundedRect(v40, 4.0, 4.0, 0);
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v5), "CGColor"));
          CGContextAddPath(CurrentContext, v28);
          CGContextFillPath(CurrentContext);
          v29 = objc_retainAutorelease(v6);
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v29, "CGColor"));
          CGContextSetLineWidth(CurrentContext, 1.0);
          CGContextAddPath(CurrentContext, v28);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(v28);
          v41.origin.x = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v11, v21, v23, v25, v27);
          v30 = CGPathCreateWithRoundedRect(v41, 4.0, 4.0, 0);
          CGContextAddPath(CurrentContext, v30);
          CGContextSetLineWidth(CurrentContext, 2.0);
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v29), "CGColor"));
          *(_OWORD *)lengths = xmmword_1BE4FC350;
          CGContextSetLineDash(CurrentContext, self->_dashLinePhase, lengths, 2uLL);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(v30);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }

}

- (NSArray)visualizationElements
{
  return self->_visualizationElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationElements, 0);
}

@end
