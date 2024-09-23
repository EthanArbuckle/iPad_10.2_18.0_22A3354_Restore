@implementation CEKEdgeGradientView

- (CEKEdgeGradientView)initWithFrame:(CGRect)a3
{
  CEKEdgeGradientView *v3;
  uint64_t v4;
  UIColor *customEdgeGradientColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEKEdgeGradientView;
  v3 = -[CEKEdgeGradientView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
    customEdgeGradientColor = v3->_customEdgeGradientColor;
    v3->_customEdgeGradientColor = (UIColor *)v4;

    v3->_gradientDirection = 0;
    -[CEKEdgeGradientView setContentMode:](v3, "setContentMode:", 3);
    -[CEKEdgeGradientView setBackgroundColor:](v3, "setBackgroundColor:", 0);
    -[CEKEdgeGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (double)outerColorLength
{
  return fmax(self->_gradientDimensions.startFadeInset, self->_gradientDimensions.endFadeInset);
}

- (void)setOuterColorLength:(double)a3
{
  -[CEKEdgeGradientView setGradientDimensions:](self, "setGradientDimensions:", a3, self->_gradientDimensions.startFadeLength, self->_gradientDimensions.endFadeLength, a3);
}

- (double)innerFadeLength
{
  return fmax(self->_gradientDimensions.startFadeLength, self->_gradientDimensions.endFadeLength);
}

- (void)setInnerFadeLength:(double)a3
{
  -[CEKEdgeGradientView setGradientDimensions:](self, "setGradientDimensions:", self->_gradientDimensions.startFadeInset, a3, a3, self->_gradientDimensions.endFadeInset);
}

- (void)setGradientDimensions:(id)a3
{
  if (self->_gradientDimensions.startFadeInset != a3.var0
    || self->_gradientDimensions.startFadeLength != a3.var1
    || self->_gradientDimensions.endFadeLength != a3.var2
    || self->_gradientDimensions.endFadeInset != a3.var3)
  {
    self->_gradientDimensions = ($104681888C943ED0167B77A1E92465DA)a3;
    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEdgeGradientStyleBlack
{
  UIColor *customEdgeGradientColor;

  if (self->_edgeGradientStyle)
  {
    self->_edgeGradientStyle = 0;
    customEdgeGradientColor = self->_customEdgeGradientColor;
    self->_customEdgeGradientColor = 0;

    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEdgeGradientStyleMask
{
  UIColor *customEdgeGradientColor;

  if (self->_edgeGradientStyle != 1)
  {
    self->_edgeGradientStyle = 1;
    customEdgeGradientColor = self->_customEdgeGradientColor;
    self->_customEdgeGradientColor = 0;

    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCustomEdgeGradientStyleWithColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  v8 = v5;
  if (self->_customEdgeGradientColor != v5 && (v7 = -[UIColor isEqual:](v5, "isEqual:"), v6 = v8, (v7 & 1) == 0)
    || self->_edgeGradientStyle != 2)
  {
    self->_edgeGradientStyle = 2;
    objc_storeStrong((id *)&self->_customEdgeGradientColor, a3);
    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
    v6 = v8;
  }

}

- (void)setGradientDirection:(int64_t)a3
{
  if (self->_gradientDirection != a3)
  {
    self->_gradientDirection = a3;
    -[CEKEdgeGradientView setNeedsDisplay](self, "setNeedsDisplay");
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
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  const __CFArray *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  CGColorSpace *ColorSpace;
  CGGradient *v56;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  CGFloat MaxX;
  double MaxY;
  CGFloat v65;
  CGFloat v66;
  CGFloat locations[6];
  _QWORD v68[7];
  CGPoint v69;
  CGPoint v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v68[6] = *MEMORY[0x1E0C80C00];
  -[CEKEdgeGradientView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6 <= 0.0)
    return;
  v8 = v7;
  if (v7 <= 0.0)
    return;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  CurrentContext = UIGraphicsGetCurrentContext();
  v71.origin.x = v9;
  v71.origin.y = v10;
  v71.size.width = v11;
  v71.size.height = v8;
  CGContextClearRect(CurrentContext, v71);
  v13 = -[CEKEdgeGradientView edgeGradientStyle](self, "edgeGradientStyle");
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3658];
    goto LABEL_9;
  }
  if (v13 == 2)
  {
    -[CEKEdgeGradientView customEdgeGradientColor](self, "customEdgeGradientColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3658];
LABEL_9:
    objc_msgSend(v16, "clearColor");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v13 != 1)
  {
    v17 = 0;
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v17 = (void *)v15;
LABEL_12:
  objc_msgSend(v17, "set");
  v72.origin.x = v9;
  v72.origin.y = v10;
  v72.size.width = v11;
  v72.size.height = v8;
  CGContextFillRect(CurrentContext, v72);
  -[CEKEdgeGradientView contentInsets](self, "contentInsets");
  v19 = v9 + v18;
  v21 = v10 + v20;
  v23 = v11 - (v18 + v22);
  v25 = v8 - (v20 + v24);
  v73.origin.x = v9 + v18;
  v73.origin.y = v21;
  v73.size.width = v23;
  v73.size.height = v25;
  CGContextClearRect(CurrentContext, v73);
  v74.origin.x = v19;
  v74.origin.y = v21;
  v74.size.width = v23;
  v74.size.height = v25;
  CGContextClipToRect(CurrentContext, v74);
  v26 = -[CEKEdgeGradientView gradientDirection](self, "gradientDirection");
  -[CEKEdgeGradientView contentInsets](self, "contentInsets");
  v28 = v27;
  v30 = v29;
  -[CEKEdgeGradientView contentInsets](self, "contentInsets");
  v65 = v9;
  v66 = v10;
  if (v26)
  {
    v33 = v28 / v8;
    v34 = v8;
    v35 = v31 / v8;
  }
  else
  {
    v33 = v30 / v11;
    v34 = v11;
    v35 = v32 / v11;
  }
  v36 = 1.0 - v35;
  v37 = objc_retainAutorelease(v14);
  objc_msgSend(v37, "CGColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_retainAutorelease(v17);
  objc_msgSend(v39, "CGColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v38;
  v68[1] = v38;
  v68[2] = v40;
  v68[3] = v40;
  v68[4] = v38;
  v68[5] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 6);
  v41 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  -[CEKEdgeGradientView gradientDimensions](self, "gradientDimensions");
  v43 = v42 / v34;
  -[CEKEdgeGradientView gradientDimensions](self, "gradientDimensions");
  v45 = v44 / v34;
  -[CEKEdgeGradientView gradientDimensions](self, "gradientDimensions");
  v47 = v46 / v34;
  -[CEKEdgeGradientView gradientDimensions](self, "gradientDimensions");
  v49 = v48 / v34;
  if (v43 <= 0.0)
    v50 = 0.05;
  else
    v50 = v43;
  if (v45 <= 0.0)
    v51 = 0.05;
  else
    v51 = v45;
  if (v47 <= 0.0)
    v52 = 0.05;
  else
    v52 = v47;
  if (v49 <= 0.0)
    v49 = 0.05;
  locations[0] = v33;
  locations[1] = v33 + v50;
  v53 = v36 - v49;
  locations[2] = v33 + v50 + v51;
  locations[3] = v53 - v52;
  locations[4] = v53;
  locations[5] = v36;
  v54 = objc_retainAutorelease(v37);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v54, "CGColor"));
  v56 = CGGradientCreateWithColors(ColorSpace, v41, locations);
  v75.origin.x = v65;
  v75.origin.y = v66;
  v75.size.width = v11;
  v75.size.height = v8;
  MinX = CGRectGetMinX(v75);
  v76.origin.x = v65;
  v76.origin.y = v66;
  v76.size.width = v11;
  v76.size.height = v8;
  MinY = CGRectGetMinY(v76);
  v59 = v65;
  v60 = v66;
  v61 = v11;
  v62 = v8;
  if (v26)
  {
    MaxX = CGRectGetMinX(*(CGRect *)&v59);
    v77.origin.x = v65;
    v77.origin.y = v66;
    v77.size.width = v11;
    v77.size.height = v8;
    MaxY = CGRectGetMaxY(v77);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v59);
    v78.origin.x = v65;
    v78.origin.y = v66;
    v78.size.width = v11;
    v78.size.height = v8;
    MaxY = CGRectGetMinY(v78);
  }
  v70.y = MaxY;
  v69.x = MinX;
  v69.y = MinY;
  v70.x = MaxX;
  CGContextDrawLinearGradient(CurrentContext, v56, v69, v70, 0);
  CGGradientRelease(v56);

}

- (int64_t)edgeGradientStyle
{
  return self->_edgeGradientStyle;
}

- (UIColor)customEdgeGradientColor
{
  return self->_customEdgeGradientColor;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)gradientDimensions
{
  double startFadeInset;
  double startFadeLength;
  double endFadeLength;
  double endFadeInset;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  startFadeInset = self->_gradientDimensions.startFadeInset;
  startFadeLength = self->_gradientDimensions.startFadeLength;
  endFadeLength = self->_gradientDimensions.endFadeLength;
  endFadeInset = self->_gradientDimensions.endFadeInset;
  result.var3 = endFadeInset;
  result.var2 = endFadeLength;
  result.var1 = startFadeLength;
  result.var0 = startFadeInset;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEdgeGradientColor, 0);
}

@end
