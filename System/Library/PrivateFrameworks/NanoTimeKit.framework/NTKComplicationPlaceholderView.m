@implementation NTKComplicationPlaceholderView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5;
  NTKComplicationPlaceholderView *v6;
  NTKComplicationPlaceholderView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationPlaceholderView;
  v6 = -[NTKComplicationPlaceholderView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  NTKComplicationVariant *v9;
  NSString *complicationAppIdentifier;
  NSString *v11;
  NTKComplicationVariant *complicationVariant;

  v5 = a3;
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NTKComplicationPlaceholderAppIdentifierKey"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NTKComplicationPlaceholderComplicationVariantKey"));
  v9 = (NTKComplicationVariant *)objc_claimAutoreleasedReturnValue();

  complicationAppIdentifier = self->_complicationAppIdentifier;
  self->_complicationAppIdentifier = v7;
  v11 = v7;

  complicationVariant = self->_complicationVariant;
  self->_complicationVariant = v9;

  -[NTKComplicationPlaceholderView _updateLayers](self, "_updateLayers");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationPlaceholderView;
  -[NTKComplicationPlaceholderView layoutSubviews](&v10, sel_layoutSubviews);
  -[CALayer bounds](self->_strokesLayer, "bounds");
  v4 = v3;
  v6 = v5;
  -[NTKComplicationPlaceholderView bounds](self, "bounds");
  if (v4 != v8 || v6 != v7)
    -[NTKComplicationPlaceholderView _updateLayers](self, "_updateLayers");
}

- (void)_updateLayers
{
  CALayer *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  CALayer *strokesLayer;
  CALayer *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  -[CALayer removeFromSuperlayer](self->_strokesLayer, "removeFromSuperlayer");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationPlaceholderView bounds](self, "bounds");
  -[CALayer setFrame:](v3, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.65);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerRadius");
  -[CALayer setCornerRadius:](v3, "setCornerRadius:");

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "opaque");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplicationPlaceholderView setBackgroundColor:](self, "setBackgroundColor:", v8);

  }
  if (-[NTKComplicationVariant family](self->_complicationVariant, "family") == 11)
    -[NTKComplicationPlaceholderView _createRectangularLayer](self, "_createRectangularLayer");
  else
    -[NTKComplicationPlaceholderView _createCircularLayer](self, "_createCircularLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addSublayer:](v3, "addSublayer:", v9);

  strokesLayer = self->_strokesLayer;
  self->_strokesLayer = v3;
  v11 = v3;

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cornerRadius");
  v14 = v13;
  -[NTKComplicationPlaceholderView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v14);

  -[NTKComplicationPlaceholderView layer](self, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", self->_strokesLayer);

}

- (id)_createCircularLayer
{
  void *v3;
  double v4;
  void *v5;

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  -[NTKComplicationPlaceholderView _createCircularLayersWithDiameter:](self, "_createCircularLayersWithDiameter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createRectangularLayer
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double height;
  void *v15;
  CGPath *Mutable;
  id v17;
  id v18;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v21;
  CGFloat MidX;
  CGFloat v23;
  CGFloat MaxY;
  void *v25;
  id v26;
  void *v27;
  CGFloat v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerRadius");
  v5 = v4;

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = v8;
  v30.size.height = v10;
  v31 = CGRectInset(v30, 0.5, 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height, v5 + -0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();
  v13 = v12;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = v8;
  v32.size.height = v10;
  v33 = CGRectInset(v32, v13, v13);
  height = v33.size.height;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v33.origin.x, v33.origin.y, v33.size.width);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  v17 = objc_retainAutorelease(v11);
  CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v17, "CGPath"));
  v18 = objc_retainAutorelease(v15);
  CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v18, "CGPath"));
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.width = v8;
  v34.size.height = v10;
  MidY = CGRectGetMidY(v34);
  CGPathMoveToPoint(Mutable, 0, 0.0, MidY);
  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v35.size.width = v8;
  v35.size.height = v10;
  MaxX = CGRectGetMaxX(v35);
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v8;
  v36.size.height = v10;
  v21 = CGRectGetMidY(v36);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v21);
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v8;
  v37.size.height = v10;
  MidX = CGRectGetMidX(v37);
  CGPathMoveToPoint(Mutable, 0, MidX, 0.0);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v8;
  v38.size.height = v10;
  v23 = CGRectGetMidX(v38);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v8;
  v39.size.height = v10;
  MaxY = CGRectGetMaxY(v39);
  CGPathAddLineToPoint(Mutable, 0, v23, MaxY);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPath:", Mutable);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.407843137, 1.0);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v25, "setStrokeColor:", objc_msgSend(v26, "CGColor"));

  objc_msgSend(v25, "setLineWidth:", 1.0);
  objc_msgSend(v25, "setFillColor:", 0);
  CGPathRelease(Mutable);
  -[NTKComplicationPlaceholderView _createCircularLayersWithDiameter:](self, "_createCircularLayersWithDiameter:", height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  v40.size.width = v8;
  v40.size.height = v10;
  v28 = CGRectGetMidX(v40) - height * 0.5;
  v41.origin.x = 0.0;
  v41.origin.y = 0.0;
  v41.size.width = v8;
  v41.size.height = v10;
  objc_msgSend(v27, "setFrame:", v28, CGRectGetMidY(v41) - height * 0.5, height, height);
  objc_msgSend(v25, "addSublayer:", v27);

  return v25;
}

- (id)_createCircularLayersWithDiameter:(double)a3
{
  CGFloat v4;
  double v5;
  CGPath *Mutable;
  double v7;
  CGPath *v8;
  CGPath *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v4 = a3 * 0.5;
  v5 = a3 * 1.41421356 * 0.5;
  Mutable = CGPathCreateMutable();
  v7 = v5 * 0.5;
  CGPathMoveToPoint(Mutable, 0, v4 - v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 + v7);
  CGPathAddLineToPoint(Mutable, 0, v4 - v7, v4 + v7);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, 0, v4 - v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 + v7);
  CGPathMoveToPoint(Mutable, 0, v4 + v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 - v7, v4 + v7);
  v8 = CGPathCreateMutable();
  CGPathAddArc(v8, 0, v4, v4, v4, 0.0, 6.28318531, 1);
  CGPathMoveToPoint(v8, 0, 0.0, v4);
  CGPathAddLineToPoint(v8, 0, a3, v4);
  CGPathMoveToPoint(v8, 0, v4, 0.0);
  CGPathAddLineToPoint(v8, 0, v4, a3);
  v9 = CGPathCreateMutable();
  CGPathAddArc(v9, 0, v4, v4, v4 * 0.3, 0.0, 6.28318531, 1);
  CGPathAddArc(v9, 0, v4, v4, v5 * 0.5, 0.0, 6.28318531, 1);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPath:", Mutable);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.447058824, 1.0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(v10, "setLineWidth:", 1.0);
  objc_msgSend(v10, "setFillColor:", 0);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPath:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.407843137, 1.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  objc_msgSend(v12, "setLineWidth:", 1.0);
  objc_msgSend(v12, "setFillColor:", 0);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPath:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.298039216, 1.0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

  objc_msgSend(v14, "setLineWidth:", 1.0);
  objc_msgSend(v14, "setFillColor:", 0);
  CGPathRelease(Mutable);
  CGPathRelease(v8);
  CGPathRelease(v9);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", v10);
  objc_msgSend(v16, "addSublayer:", v12);
  objc_msgSend(v16, "addSublayer:", v14);

  return v16;
}

- (id)_createDownloadMaskLayer
{
  _BOOL8 v3;

  v3 = -[NTKComplicationVariant family](self->_complicationVariant, "family") == 11;
  -[NTKComplicationPlaceholderView _circleDiameter](self, "_circleDiameter");
  return -[NTKComplicationPlaceholderView _createDownloadProgressMaskWithDiameter:progress:contained:](self, "_createDownloadProgressMaskWithDiameter:progress:contained:", v3);
}

- (double)_circleDiameter
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

  if (-[NTKComplicationVariant family](self->_complicationVariant, "family") != 11)
    return v5;
  CLKRoundForDevice();
  return v5 + v6 * -2.0;
}

- (id)_createDownloadProgressMaskWithDiameter:(double)a3 progress:(double)a4 contained:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPath *Mutable;
  CGFloat MidX;
  CGFloat MidY;
  void *v16;
  id v17;
  id v18;
  CGRect v20;
  CGRect v21;

  v5 = a5;
  -[NTKComplicationVariant metrics](self->_complicationVariant, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  Mutable = CGPathCreateMutable();
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v10;
  v20.size.height = v12;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v10;
  v21.size.height = v12;
  MidY = CGRectGetMidY(v21);
  if (v5)
  {
    CGPathAddArc(Mutable, 0, MidX, MidY, a3 * 0.5, 0.0, 6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }
  CGPathMoveToPoint(Mutable, 0, MidX, MidY);
  CGPathAddArc(Mutable, 0, MidX, MidY, a3 * 1.41421356 * 0.5 * 0.5, -1.57079633, a4 * 6.28318531 + -1.57079633, 1);
  CGPathCloseSubpath(Mutable);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPath:", Mutable);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setFillColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v16, "setLineWidth:", 1.0);
  objc_msgSend(v16, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

  return v16;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->filterProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->filterProvider);
  objc_storeStrong((id *)&self->_strokesLayer, 0);
  objc_storeStrong((id *)&self->_complicationVariant, 0);
  objc_storeStrong((id *)&self->_complicationAppIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
