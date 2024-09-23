@implementation SBHorizontalScrollFailureTriangleView

- (SBHorizontalScrollFailureTriangleView)initWithStyle:(int)a3 recognizer:(id)a4 forPoint:(CGPoint)a5 withMaxVerticalOffset:(double)a6 inView:(id)a7 pointingRight:(BOOL)a8
{
  double y;
  double x;
  id v15;
  id v16;
  SBHorizontalScrollFailureTriangleView *v17;
  SBHorizontalScrollFailureTriangleView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  objc_super v30;

  y = a5.y;
  x = a5.x;
  v15 = a4;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBHorizontalScrollFailureTriangleView;
  v17 = -[SBHorizontalScrollFailureTriangleView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (v17)
  {
    v17->_style = a3;
    v17->_pointingRight = a8;
    objc_msgSend(v16, "bounds");
    if (v18->_pointingRight)
      v20 = v19 - x;
    else
      v20 = x;
    v21 = 0.0;
    if (!v18->_pointingRight)
      v21 = x;
    v22 = x - v21;
    if (v18->_style)
    {
      objc_msgSend(v15, "_effectiveBottomAngle");
      v24 = v20 * tan(v23 * 0.0174532925);
      v25 = y + a6;
    }
    else
    {
      objc_msgSend(v15, "_effectiveTopAngle");
      v24 = v20 * tan(v26 * 0.0174532925);
      v25 = y - a6 - v24;
    }
    -[SBHorizontalScrollFailureTriangleView setFrame:](v18, "setFrame:", v22, v25, v20, v24);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHorizontalScrollFailureTriangleView setBackgroundColor:](v18, "setBackgroundColor:", v27);

    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHorizontalScrollFailureTriangleView setContentColor:](v18, "setContentColor:", v28);

  }
  return v18;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  _BOOL4 pointingRight;
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
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pointingRight = self->_pointingRight;
  v20 = v4;
  if (!self->_style)
  {
    -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
    if (pointingRight)
    {
      v4 = v20;
      v6 = v8;
      goto LABEL_6;
    }
    v17 = v7;
    -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
    objc_msgSend(v20, "moveToPoint:", v17, v18);
    -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
    v16 = v19;
    v13 = 0.0;
LABEL_9:
    objc_msgSend(v20, "addLineToPoint:", 0.0, v16);
    goto LABEL_10;
  }
  if (!self->_pointingRight)
  {
    -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
    v13 = 0.0;
    objc_msgSend(v20, "moveToPoint:", v14, 0.0);
    -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
    v16 = v15;
    goto LABEL_9;
  }
  v6 = 0.0;
LABEL_6:
  objc_msgSend(v4, "moveToPoint:", 0.0, v6);
  -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
  v10 = v9;
  -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
  objc_msgSend(v20, "addLineToPoint:", v10, v11);
  -[SBHorizontalScrollFailureTriangleView bounds](self, "bounds");
  v13 = v12;
LABEL_10:
  objc_msgSend(v20, "addLineToPoint:", v13, 0.0);
  objc_msgSend(v20, "closePath");
  -[UIColor setFill](self->_contentColor, "setFill");
  objc_msgSend(v20, "fill");

}

- (void)setContentColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_contentColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentColor, a3);
    -[SBHorizontalScrollFailureTriangleView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
}

@end
