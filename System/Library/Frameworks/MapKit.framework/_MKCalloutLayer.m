@implementation _MKCalloutLayer

- (CGSize)_contentSize
{
  double cornerRadius;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  cornerRadius = self->_metrics.cornerRadius;
  if (self->_arrowPosition)
  {
    v3 = self->_metrics.arrowBase + self->_metrics.var0.radialSmoothing.arrowBaseRadius * 2.0 + 2.0;
    v4 = self->_metrics.arrowHeight + 1.0;
  }
  else
  {
    v4 = 1.0;
    v3 = 1.0;
  }
  v5 = cornerRadius + cornerRadius;
  v6 = cornerRadius + cornerRadius + v3;
  v7 = v5 + v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGImage)_newContentImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double cornerRadius;
  double v8;
  double v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  double arrowHeight;
  double v13;
  CGPath *Mutable;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint CurrentPoint;
  double arrowRadius;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  UIColor *fillColor;
  CGImage *Image;
  CGFloat v30;
  double arrowBase;
  double v32;
  double v33;
  CGRect v34;

  -[_MKCalloutLayer _contentSize](self, "_contentSize");
  v4 = v3;
  v6 = v5;
  cornerRadius = self->_metrics.cornerRadius;
  -[_MKCalloutLayer contentsScale](self, "contentsScale");
  v9 = v8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGBitmapContextCreate(0, (unint64_t)(v4 * v9), (unint64_t)(v6 * v9), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextTranslateCTM(v11, 0.0, v6 * v9);
  CGContextScaleCTM(v11, v9, -v9);
  if (self->_arrowPosition)
  {
    arrowHeight = self->_metrics.arrowHeight;
    arrowBase = self->_metrics.arrowBase;
    v13 = v6 - arrowHeight;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v4 - cornerRadius, v6 - arrowHeight);
    CGPathAddArcToPoint(Mutable, 0, v4, v6 - arrowHeight, v4, v6 + 1.0 - (cornerRadius + arrowHeight), cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, v4, cornerRadius);
    CGPathAddArcToPoint(Mutable, 0, v4, 0.0, v4 - cornerRadius, 0.0, cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, cornerRadius, 0.0);
    CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 0.0, cornerRadius, cornerRadius);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v6 + 1.0 - (cornerRadius + arrowHeight));
    CGPathAddArcToPoint(Mutable, 0, 0.0, v6 - arrowHeight, cornerRadius, v6 - arrowHeight, cornerRadius);
    v33 = cornerRadius + 1.0;
    CGPathAddLineToPoint(Mutable, 0, cornerRadius + 1.0, v6 - arrowHeight);
    if (self->_metrics.useRadialSmoothing)
    {
      v15 = arrowBase * 0.5;
      v16 = atan(arrowHeight / (arrowBase * 0.5));
      v17 = v4 * 0.5;
      if (v16 >= 0.0)
        v18 = -v16;
      else
        v18 = v16;
      CGPathAddArc(Mutable, 0, v4 * 0.5 - v15 - self->_metrics.var0.radialSmoothing.arrowBaseRadius * 0.5, v13 + self->_metrics.var0.radialSmoothing.arrowBaseRadius, self->_metrics.var0.radialSmoothing.arrowBaseRadius, -1.57079633, v18, 0);
      CurrentPoint = CGPathGetCurrentPoint(Mutable);
      CGPathAddArcToPoint(Mutable, 0, v4 * 0.5, v6, v17 + v17 - CurrentPoint.x, CurrentPoint.y, self->_metrics.var0.radialSmoothing.arrowRadius);
      CGPathAddLineToPoint(Mutable, 0, v17 + v15, v6 - arrowHeight);
      CGPathAddLineToPoint(Mutable, 0, v4 - v33, v6 - arrowHeight);
    }
    else
    {
      arrowRadius = self->_metrics.var0.radialSmoothing.arrowRadius;
      v21 = arrowBase * 0.5;
      v22 = self->_metrics.var0.radialSmoothing.arrowBaseRadius / sqrt(v21 * v21 + arrowHeight * arrowHeight);
      v32 = v9;
      v23 = v21 * v22;
      v24 = arrowHeight * v22;
      v30 = v13 + v24;
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5 - v21, v13, v4 * 0.5 - v21 + v21 * v22, v13 + v24);
      v25 = v6 - v24 * arrowRadius;
      CGPathAddLineToPoint(Mutable, 0, v4 * 0.5 - v23 * arrowRadius, v25);
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5, v6, v4 * 0.5 + v23 * arrowRadius, v25);
      v26 = v4 * 0.5 + v21 - v23;
      v9 = v32;
      CGPathAddLineToPoint(Mutable, 0, v26, v30);
      CGPathAddQuadCurveToPoint(Mutable, 0, v4 * 0.5 + v21, v13, v4 - v33, v13);
    }
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = v4;
    v34.size.height = v6;
    Mutable = CGPathCreateWithRoundedRect(v34, cornerRadius, cornerRadius, 0);
  }
  CGContextAddPath(v11, Mutable);
  fillColor = self->_fillColor;
  if (fillColor)
  {
    CGContextSetFillColorWithColor(v11, -[UIColor CGColor](fillColor, "CGColor"));
    CGContextFillPath(v11);
  }
  if (self->_strokeColor)
  {
    CGContextClip(v11);
    CGContextAddPath(v11, Mutable);
    CGContextSetStrokeColorWithColor(v11, -[UIColor CGColor](self->_strokeColor, "CGColor"));
    CGContextSetLineWidth(v11, 1.0 / v9 + 1.0 / v9);
    CGContextStrokePath(v11);
  }
  CGPathRelease(Mutable);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (_MKCalloutLayer)init
{
  _MKCalloutLayer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKCalloutLayer;
  v2 = -[_MKCalloutLayer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKCalloutLayer setFillColor:](v2, "setFillColor:", v3);

    -[_MKResizingLayer setNeedsLayoutOnBoundsChange:](v2, "setNeedsLayoutOnBoundsChange:", 1);
  }
  return v2;
}

- (void)dealloc
{
  CGImage *contentImage;
  objc_super v4;

  contentImage = self->_contentImage;
  if (contentImage)
  {
    CGImageRelease(contentImage);
    self->_contentImage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_MKCalloutLayer;
  -[_MKCalloutLayer dealloc](&v4, sel_dealloc);
}

- (void)setContentsScale:(double)a3
{
  CGImage *contentImage;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKCalloutLayer;
  -[_MKResizingLayer setContentsScale:](&v5, sel_setContentsScale_, a3);
  contentImage = self->_contentImage;
  if (contentImage)
  {
    CGImageRelease(contentImage);
    self->_contentImage = 0;
  }
  -[_MKCalloutLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setArrowPosition:(int64_t)a3
{
  CGImage *contentImage;

  if (self->_arrowPosition != a3)
  {
    self->_arrowPosition = a3;
    contentImage = self->_contentImage;
    if (contentImage)
    {
      CGImageRelease(contentImage);
      self->_contentImage = 0;
    }
    -[_MKCalloutLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setArrowOffset:(double)a3
{
  if (self->_arrowOffset != a3)
  {
    self->_arrowOffset = a3;
    -[_MKCalloutLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSublayers
{
  CALayer *v3;
  CALayer *leftLayer;
  CALayer *v5;
  CALayer *rightLayer;
  double v7;
  double v8;
  void *v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _MKCalloutLayer *v15;
  CALayer *v16;
  CALayer *v17;
  double cornerRadius;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t arrowPosition;
  double v25;
  double v26;
  double v27;
  double arrowOffset;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int64_t v36;
  CATransform3D *v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  CATransform3D v43;
  CATransform3D v44;
  CATransform3D v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)_MKCalloutLayer;
  -[_MKCalloutLayer layoutSublayers](&v46, sel_layoutSublayers);
  if (!self->_contentImage)
  {
    self->_contentImage = -[_MKCalloutLayer _newContentImage](self, "_newContentImage");
    if (self->_arrowPosition)
    {
      -[_MKCalloutLayer setContents:](self, "setContents:", 0);
      if (!self->_leftLayer)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
        leftLayer = self->_leftLayer;
        self->_leftLayer = v3;

        -[_MKCalloutLayer addSublayer:](self, "addSublayer:", self->_leftLayer);
        -[_MKCalloutLayer contentsScale](self, "contentsScale");
        -[CALayer setContentsScale:](self->_leftLayer, "setContentsScale:");
        -[CALayer setGeometryFlipped:](self->_leftLayer, "setGeometryFlipped:", 1);
        -[CALayer setAllowsEdgeAntialiasing:](self->_leftLayer, "setAllowsEdgeAntialiasing:", 0);
      }
      if (!self->_rightLayer)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
        rightLayer = self->_rightLayer;
        self->_rightLayer = v5;

        -[_MKCalloutLayer addSublayer:](self, "addSublayer:", self->_rightLayer);
        -[_MKCalloutLayer contentsScale](self, "contentsScale");
        -[CALayer setContentsScale:](self->_rightLayer, "setContentsScale:");
        -[CALayer setGeometryFlipped:](self->_rightLayer, "setGeometryFlipped:", 1);
        -[CALayer setAllowsEdgeAntialiasing:](self->_rightLayer, "setAllowsEdgeAntialiasing:", 0);
      }
      -[CALayer setContents:](self->_leftLayer, "setContents:", self->_contentImage);
      -[CALayer setContentsRect:](self->_leftLayer, "setContentsRect:", 0.0, 0.0, 0.5, 1.0);
      -[_MKCalloutLayer _contentSize](self, "_contentSize");
      -[CALayer setContentsCenter:](self->_leftLayer, "setContentsCenter:", self->_metrics.cornerRadius / (v7 * 0.5), 1.0 - self->_metrics.cornerRadius / v8, 1.0 / v7, 1.0 / v8);
      -[CALayer contents](self->_leftLayer, "contents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setContents:](self->_rightLayer, "setContents:", v9);

      -[CALayer contentsRect](self->_leftLayer, "contentsRect");
      -[CALayer setContentsRect:](self->_rightLayer, "setContentsRect:");
      CATransform3DMakeScale(&v45, -1.0, 1.0, 1.0);
      v10 = self->_rightLayer;
      v44 = v45;
      -[CALayer setTransform:](v10, "setTransform:", &v44);
      -[CALayer contentsCenter](self->_leftLayer, "contentsCenter");
      v15 = (_MKCalloutLayer *)self->_rightLayer;
    }
    else
    {
      -[CALayer removeFromSuperlayer](self->_leftLayer, "removeFromSuperlayer");
      v16 = self->_leftLayer;
      self->_leftLayer = 0;

      -[CALayer removeFromSuperlayer](self->_rightLayer, "removeFromSuperlayer");
      v17 = self->_rightLayer;
      self->_rightLayer = 0;

      cornerRadius = self->_metrics.cornerRadius;
      v19 = cornerRadius * 2.0 + 1.0;
      -[_MKCalloutLayer setContents:](self, "setContents:", self->_contentImage);
      v11 = cornerRadius / v19;
      v13 = 1.0 / v19;
      v15 = self;
      v12 = cornerRadius / v19;
      v14 = 1.0 / v19;
    }
    -[_MKCalloutLayer setContentsCenter:](v15, "setContentsCenter:", v11, v12, v13, v14);
  }
  if (self->_arrowPosition)
  {
    -[_MKCalloutLayer bounds](self, "bounds");
    arrowPosition = self->_arrowPosition;
    if ((unint64_t)(arrowPosition - 3) <= 1)
      v25 = v22;
    else
      v25 = v23;
    if ((unint64_t)(arrowPosition - 3) <= 1)
      v26 = v23;
    else
      v26 = v22;
    if ((unint64_t)(arrowPosition - 3) <= 1)
      v27 = (v22 - v23) * 0.5;
    else
      v27 = v20;
    arrowOffset = self->_arrowOffset;
    if ((unint64_t)(arrowPosition - 3) <= 1)
      v29 = (v23 - v22) * 0.5;
    else
      v29 = v21;
    if (arrowPosition == 4)
      arrowOffset = -arrowOffset;
    v30 = v26 * 0.5 + arrowOffset;
    -[_MKCalloutLayer contentsScale](self, "contentsScale");
    v32 = round(v31 * v30);
    -[_MKCalloutLayer contentsScale](self, "contentsScale");
    v34 = v26 - v32 / v33;
    v35 = v27 + v32 / v33;
    -[CALayer setFrame:](self->_leftLayer, "setFrame:", v27, v29);
    -[CALayer setFrame:](self->_rightLayer, "setFrame:", v35, v29, v34, v25);
    v36 = self->_arrowPosition;
    switch(v36)
    {
      case 4:
        CATransform3DMakeRotation(&v39, -1.57079633, 0.0, 0.0, 1.0);
        v38 = v39;
        v37 = &v38;
        break;
      case 3:
        CATransform3DMakeRotation(&v41, 1.57079633, 0.0, 0.0, 1.0);
        v40 = v41;
        v37 = &v40;
        break;
      case 1:
        CATransform3DMakeScale(&v43, 1.0, -1.0, 1.0);
        v42 = v43;
        v37 = &v42;
        break;
      default:
        return;
    }
    -[_MKCalloutLayer setSublayerTransform:](self, "setSublayerTransform:", v37, *(_OWORD *)&v38.m11, *(_OWORD *)&v38.m13, *(_OWORD *)&v38.m21, *(_OWORD *)&v38.m23, *(_OWORD *)&v38.m31, *(_OWORD *)&v38.m33, *(_OWORD *)&v38.m41, *(_OWORD *)&v38.m43);
  }
}

- ($A40DED58D0841436B22ED035DCBF2680)metrics
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var5.var1.var1 = v3;
  v4 = *(_OWORD *)&self[1].var6;
  *($CAB4DCDF46D014B19132C003A101DDEC *)&retstr->var8.top = self[1].var5;
  *(_OWORD *)&retstr->var8.bottom = v4;
  v5 = *(_OWORD *)&self->var8.right;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var8.left;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (void)setMetrics:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_metrics.margin = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_metrics.arrowBase = v3;
  v4 = *(_OWORD *)&a3->var8.bottom;
  v6 = *(_OWORD *)&a3->var4;
  v5 = *(_OWORD *)&a3->var5.var1.var1;
  *(_OWORD *)&self->_metrics.padding.top = *(_OWORD *)&a3->var8.top;
  *(_OWORD *)&self->_metrics.padding.bottom = v4;
  *(_OWORD *)&self->_metrics.useRadialSmoothing = v6;
  *(_OWORD *)&self->_metrics.var0.nonRadialSmoothing.arrowPointFactor = v5;
}

- (int64_t)arrowPosition
{
  return self->_arrowPosition;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_rightLayer, 0);
  objc_storeStrong((id *)&self->_leftLayer, 0);
}

@end
