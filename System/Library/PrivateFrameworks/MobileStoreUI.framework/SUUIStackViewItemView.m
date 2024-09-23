@implementation SUUIStackViewItemView

- (void)setBorderColor:(id)a3
{
  UIColor *v4;
  UIColor *borderColor;

  if (self->_borderColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    borderColor = self->_borderColor;
    self->_borderColor = v4;

    -[SUUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[SUUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setShouldFlipImageHorizontal:(BOOL)a3
{
  if (self->_shouldFlipImageHorizontal != a3)
  {
    self->_shouldFlipImageHorizontal = a3;
    -[SUUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShouldFlipImageVertical:(BOOL)a3
{
  if (self->_shouldFlipImageVertical != a3)
  {
    self->_shouldFlipImageVertical = a3;
    -[SUUIStackViewItemView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  _BOOL4 shouldFlipImageVertical;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  UIColor *borderColor;
  double v19;
  void *v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[SUUIStackViewItemView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  shouldFlipImageVertical = self->_shouldFlipImageVertical;
  v14 = -1.0;
  if (self->_shouldFlipImageHorizontal)
  {
    v15 = -1.0;
  }
  else
  {
    if (!self->_shouldFlipImageVertical)
      goto LABEL_12;
    v15 = 1.0;
    shouldFlipImageVertical = 1;
  }
  if (!shouldFlipImageVertical)
    v14 = 1.0;
  CGContextScaleCTM(CurrentContext, v15, v14);
  v16 = -v9;
  v17 = 0.0;
  if (!self->_shouldFlipImageHorizontal)
    v16 = 0.0;
  if (self->_shouldFlipImageVertical)
    v17 = -v11;
  CGContextTranslateCTM(CurrentContext, v16, v17);
LABEL_12:
  -[UIImage drawInRect:](self->_image, "drawInRect:", v5, v7, v9, v11);
  CGContextRestoreGState(CurrentContext);
  borderColor = self->_borderColor;
  if (borderColor)
  {
    v19 = *(double *)&drawRect__borderWidth;
    if (*(double *)&drawRect__borderWidth == 0.0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&drawRect__borderWidth);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      *(double *)&drawRect__borderWidth = 1.0 / v21;

      borderColor = self->_borderColor;
    }
    -[UIColor set](borderColor, "set", v19);
    *(_QWORD *)&v22.size.height = drawRect__borderWidth;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v9;
    UIRectFillUsingBlendMode(v22, kCGBlendModeNormal);
    *(_QWORD *)&v23.origin.y = drawRect__borderWidth;
    v23.origin.x = v9 - *(double *)&drawRect__borderWidth;
    v23.size.height = v11 - *(double *)&drawRect__borderWidth * 2.0;
    *(_QWORD *)&v23.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v23, kCGBlendModeNormal);
    *(_QWORD *)&v24.size.height = drawRect__borderWidth;
    v24.origin.y = v11 - *(double *)&drawRect__borderWidth;
    v24.origin.x = 0.0;
    v24.size.width = v9;
    UIRectFillUsingBlendMode(v24, kCGBlendModeNormal);
    *(_QWORD *)&v25.origin.y = drawRect__borderWidth;
    v25.size.height = v11 - *(double *)&drawRect__borderWidth * 2.0;
    v25.origin.x = 0.0;
    *(_QWORD *)&v25.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v25, kCGBlendModeNormal);
  }
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldFlipImageHorizontal
{
  return self->_shouldFlipImageHorizontal;
}

- (BOOL)shouldFlipImageVertical
{
  return self->_shouldFlipImageVertical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
