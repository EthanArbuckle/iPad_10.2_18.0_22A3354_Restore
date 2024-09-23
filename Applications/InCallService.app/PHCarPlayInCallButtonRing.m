@implementation PHCarPlayInCallButtonRing

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  -[PHCarPlayInCallButtonRing setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setDimmed:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    if (a3)
      v4 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarQuaternaryColor](UIColor, "dynamicCarQuaternaryColor"));
    else
      v4 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarTertiaryColor](UIColor, "dynamicCarTertiaryColor"));
    v5 = (void *)v4;
    -[PHCarPlayInCallButtonRing setFillColor:](self, "setFillColor:", v4);

    -[PHCarPlayInCallButtonRing setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[PHCarPlayInCallButtonRing setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  -[PHCarPlayInCallButtonRing setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setToggledOn:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  self->_toggledOn = a3;
  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarPrimaryColor](UIColor, "dynamicCarPrimaryColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarTertiaryColor](UIColor, "dynamicCarTertiaryColor"));
  v5 = (void *)v4;
  -[PHCarPlayInCallButtonRing setFillColor:](self, "setFillColor:", v4);

  -[PHCarPlayInCallButtonRing setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v5, "setStroke");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonRing fillColor](self, "fillColor"));
  v7 = -[PHCarPlayInCallButtonRing highlighted](self, "highlighted");
  v8 = v7;
  if (!v6)
  {
    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarQuaternaryColor](UIColor, "dynamicCarQuaternaryColor"));
    }
    else
    {
      if (!-[PHCarPlayInCallButtonRing selected](self, "selected"))
      {
        if (-[PHCarPlayInCallButtonRing dimmed](self, "dimmed"))
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
        else
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarQuaternaryColor](UIColor, "dynamicCarQuaternaryColor"));
        v20 = v19;
        objc_msgSend(v19, "set");

        v15 = 0x404A000000000000;
        v16 = 1.0;
        v17 = 1.0;
        goto LABEL_17;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
    }
    v18 = v12;
    objc_msgSend(v12, "set");

LABEL_12:
    v23.size.width = 52.0;
    v23.origin.x = 1.0;
    v23.origin.y = 1.0;
    v23.size.height = 52.0;
    CGContextFillEllipseInRect(CurrentContext, v23);
    return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonRing fillColor](self, "fillColor"));
  v10 = v9;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.5));
    objc_msgSend(v11, "set");

  }
  else
  {
    objc_msgSend(v9, "set");
  }

  if (!-[PHCarPlayInCallButtonRing selected](self, "selected"))
    goto LABEL_12;
  CGContextSetLineWidth(CurrentContext, 0.0);
  v22.size.width = 42.0;
  v22.origin.x = 6.0;
  v22.origin.y = 6.0;
  v22.size.height = 42.0;
  CGContextFillEllipseInRect(CurrentContext, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v13, "set");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
  objc_msgSend(v14, "setStroke");

  CGContextSetLineWidth(CurrentContext, 3.0);
  v15 = 0x4048800000000000;
  v16 = 2.5;
  v17 = 2.5;
LABEL_17:
  v21 = v15;
  CGContextStrokeEllipseInRect(CurrentContext, *(CGRect *)&v16);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 54.0;
  v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)toggledOn
{
  return self->_toggledOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
