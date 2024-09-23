@implementation AXPIPinchChainView

- (AXPIPinchChainView)initWithFrame:(CGRect)a3
{
  AXPIPinchChainView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXPIPinchChainView;
  v3 = -[AXPIPinchChainView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPIPinchChainView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[AXPIPinchChainView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)setStartPoint:(CGPoint)a3
{
  if (self->_startPoint.x != a3.x || self->_startPoint.y != a3.y)
  {
    self->_startPoint = a3;
    -[AXPIPinchChainView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEndPoint:(CGPoint)a3
{
  if (self->_endPoint.x != a3.x || self->_endPoint.y != a3.y)
  {
    self->_endPoint = a3;
    -[AXPIPinchChainView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[AXPIPinchChainView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[AXPIPinchChainView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  char v8;
  CGContext *CurrentContext;
  double x;
  double v11;
  double v12;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  __double2 v34;
  void *v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  char v46;
  void *v47;
  double v48;
  __double2 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  CGFloat v55;
  CGRect v56;
  CGRect v57;

  -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fingerWidth");
  v6 = v5;

  v56.origin.x = self->_startPoint.x;
  v56.origin.y = self->_startPoint.y;
  v57.origin.x = self->_endPoint.x;
  v57.origin.y = self->_endPoint.y;
  v56.size.width = v6;
  v56.size.height = v6;
  v57.size.width = v6;
  v57.size.height = v6;
  if (!CGRectIntersectsRect(v56, v57))
  {
    if (+[AXPIFingerUtilities laserEnabled](AXPIFingerUtilities, "laserEnabled"))
    {
      -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "useSystemFilters");

    }
    else
    {
      v8 = 0;
    }
    CurrentContext = UIGraphicsGetCurrentContext();
    x = self->_startPoint.x;
    -[AXPIPinchChainView frame](self, "frame");
    v12 = x - v11;
    y = self->_startPoint.y;
    -[AXPIPinchChainView frame](self, "frame");
    v15 = y - v14;
    v16 = self->_endPoint.x;
    -[AXPIPinchChainView frame](self, "frame");
    v18 = v16 - v17;
    v19 = self->_endPoint.y;
    -[AXPIPinchChainView frame](self, "frame");
    v21 = v19 - v20;
    v22 = atan2(v19 - v20 - v15, v18 - v12);
    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fingerInnerRadius");
    v25 = v24;
    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "strokeWidth");
    v28 = v27;
    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "strokeOutlineWidth");
    v31 = v30;

    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v32, "showInnerCircle");

    if ((_DWORD)v26)
    {
      v33 = v25 + v28 + v31 * 0.5;
      v34 = __sincos_stret(v22);
      CGContextMoveToPoint(CurrentContext, v12 + v33 * v34.__cosval, v15 + v33 * v34.__sinval);
      CGContextAddLineToPoint(CurrentContext, v18 - v33 * v34.__cosval, v21 - v33 * v34.__sinval);
      -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "strokeOutlineColor");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v36, "CGColor"));

      -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "strokeOutlineWidth");
      v39 = v38;
      -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "strokeWidth");
      CGContextSetLineWidth(CurrentContext, v41 + v39 * 2.0);

      CGContextStrokePath(CurrentContext);
    }
    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fingerInnerRadius");
    v44 = v43;

    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "showFingerOutlines");

    if ((v46 & 1) == 0)
    {
      -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "strokeWidth");
      v44 = v44 + v48 * -0.5;

    }
    v49 = __sincos_stret(v22);
    CGContextMoveToPoint(CurrentContext, v12 + v44 * v49.__cosval, v15 + v44 * v49.__sinval);
    CGContextAddLineToPoint(CurrentContext, v18 - v44 * v49.__cosval, v21 - v44 * v49.__sinval);
    if ((v8 & 1) == 0)
    {
      if (-[AXPIPinchChainView isPressed](self, "isPressed") || -[AXPIPinchChainView isSelected](self, "isSelected"))
      {
        -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "selectedStrokeColor");
        v51 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "deselectedStrokeColor");
        v51 = objc_claimAutoreleasedReturnValue();
      }
      v52 = (void *)v51;

      v53 = objc_retainAutorelease(v52);
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v53, "CGColor"));

    }
    -[AXPIPinchChainView appearanceDelegate](self, "appearanceDelegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "strokeWidth");
    CGContextSetLineWidth(CurrentContext, v55);

    CGContextStrokePath(CurrentContext);
  }
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  return (AXPIFingerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end
