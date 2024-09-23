@implementation PHInCallRoundedRectView

- (PHInCallRoundedRectView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PHInCallRoundedRectView *v5;
  PHInCallRoundedRectView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CALayer *luminanceRingLayer;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CALayer *dodgeRingLayer;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CALayer *highlightLuminanceLayer;
  void *v22;
  void *v23;
  uint64_t v24;
  CALayer *highlightDodgeLayer;
  id v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  CALayer *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  objc_super v37;

  height = a3.size.height;
  width = a3.size.width;
  v37.receiver = self;
  v37.super_class = (Class)PHInCallRoundedRectView;
  v5 = -[PHInCallRoundedRectView initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[PHInCallRoundedRectView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[PHInCallRoundedRectView setOpaque:](v6, "setOpaque:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHInCallRoundedRectView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    -[PHInCallRoundedRectView setStrokeWidth:](v6, "setStrokeWidth:", 1.5);
    -[PHInCallRoundedRectView setCornerRadius:](v6, "setCornerRadius:", 5.0);
    v10 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    luminanceRingLayer = v6->_luminanceRingLayer;
    v6->_luminanceRingLayer = (CALayer *)v10;

    v12 = kCAFilterPlusL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    -[CALayer setCompositingFilter:](v6->_luminanceRingLayer, "setCompositingFilter:", v13);

    -[CALayer setFrame:](v6->_luminanceRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v14, "addSublayer:", v6->_luminanceRingLayer);

    v15 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    dodgeRingLayer = v6->_dodgeRingLayer;
    v6->_dodgeRingLayer = (CALayer *)v15;

    v17 = kCAFilterColorDodgeBlendMode;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorDodgeBlendMode));
    -[CALayer setCompositingFilter:](v6->_dodgeRingLayer, "setCompositingFilter:", v18);

    -[CALayer setFrame:](v6->_dodgeRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v19, "addSublayer:", v6->_dodgeRingLayer);

    v20 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightLuminanceLayer = v6->_highlightLuminanceLayer;
    v6->_highlightLuminanceLayer = (CALayer *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v17));
    -[CALayer setCompositingFilter:](v6->_highlightLuminanceLayer, "setCompositingFilter:", v22);

    -[CALayer setFrame:](v6->_highlightLuminanceLayer, "setFrame:", 0.0, 0.0, width, height);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v23, "addSublayer:", v6->_highlightLuminanceLayer);

    v24 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightDodgeLayer = v6->_highlightDodgeLayer;
    v6->_highlightDodgeLayer = (CALayer *)v24;

    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0)));
    -[CALayer setBackgroundColor:](v6->_highlightDodgeLayer, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v17));
    -[CALayer setCompositingFilter:](v6->_highlightDodgeLayer, "setCompositingFilter:", v27);

    -[CALayer setFrame:](v6->_highlightDodgeLayer, "setFrame:", 0.0, 0.0, width, height);
    -[PHInCallRoundedRectView cornerRadius](v6, "cornerRadius");
    -[CALayer setCornerRadius:](v6->_highlightDodgeLayer, "setCornerRadius:");
    LODWORD(v28) = 0;
    -[CALayer setOpacity:](v6->_highlightDodgeLayer, "setOpacity:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v29, "addSublayer:", v6->_highlightDodgeLayer);

    v30 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    v31 = v6->_highlightLuminanceLayer;
    v6->_highlightLuminanceLayer = (CALayer *)v30;

    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007)));
    -[CALayer setBackgroundColor:](v6->_highlightLuminanceLayer, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v12));
    -[CALayer setCompositingFilter:](v6->_highlightLuminanceLayer, "setCompositingFilter:", v33);

    -[CALayer setFrame:](v6->_highlightLuminanceLayer, "setFrame:", 0.0, 0.0, width, height);
    -[PHInCallRoundedRectView cornerRadius](v6, "cornerRadius");
    -[CALayer setCornerRadius:](v6->_highlightLuminanceLayer, "setCornerRadius:");
    LODWORD(v34) = 0;
    -[CALayer setOpacity:](v6->_highlightLuminanceLayer, "setOpacity:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView layer](v6, "layer"));
    objc_msgSend(v35, "insertSublayer:below:", v6->_highlightLuminanceLayer, v6->_highlightDodgeLayer);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
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
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PHInCallRoundedRectView;
  -[PHInCallRoundedRectView layoutSubviews](&v27, "layoutSubviews");
  -[PHInCallRoundedRectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer setFrame:](self->_highlightDodgeLayer, "setFrame:");
  -[CALayer setFrame:](self->_highlightLuminanceLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_dodgeRingLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_luminanceRingLayer, "setFrame:", v4, v6, v8, v10);
  -[PHInCallRoundedRectView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  -[PHInCallRoundedRectView strokeWidth](self, "strokeWidth");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007));
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView createRingImageWithSize:strokeWidth:color:](self, "createRingImageWithSize:strokeWidth:color:", v17, v12, v14, v16)));
  -[CALayer setContents:](self->_luminanceRingLayer, "setContents:", objc_msgSend(v18, "CGImage"));

  -[PHInCallRoundedRectView bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  -[PHInCallRoundedRectView strokeWidth](self, "strokeWidth");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0));
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PHInCallRoundedRectView createRingImageWithSize:strokeWidth:color:](self, "createRingImageWithSize:strokeWidth:color:", v25, v20, v22, v24)));
  -[CALayer setContents:](self->_dodgeRingLayer, "setContents:", objc_msgSend(v26, "CGImage"));

}

- (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height;
  double width;
  id v9;
  double x;
  double y;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  UIImage *ImageFromCurrentImageContext;
  void *v19;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, a4, a4);
  x = v22.origin.x;
  y = v22.origin.y;
  v12 = v22.size.width;
  v13 = v22.size.height;
  v22.origin.x = width;
  v22.origin.y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v22.origin, 0, 0.0);
  -[PHInCallRoundedRectView cornerRadius](self, "cornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v14));
  -[PHInCallRoundedRectView cornerRadius](self, "cornerRadius");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v16));
  objc_msgSend(v15, "appendPath:", v17);

  objc_msgSend(v15, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v9, "setFill");

  objc_msgSend(v15, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v19;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;
  float v8;
  double v9;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  if (v3)
    v8 = 1.0;
  else
    v8 = 0.0;
  *(float *)&v7 = v8;
  -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v7);
  *(float *)&v9 = v8;
  -[CALayer setOpacity:](self->_highlightLuminanceLayer, "setOpacity:", v9);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;
  float v8;
  double v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHInCallRoundedRectView;
  -[PHInCallRoundedRectView setUserInteractionEnabled:](&v10, "setUserInteractionEnabled:");
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  if (v3)
    v8 = 1.0;
  else
    v8 = 0.6;
  *(float *)&v7 = v8;
  -[CALayer setOpacity:](self->_luminanceRingLayer, "setOpacity:", v7);
  *(float *)&v9 = v8;
  -[CALayer setOpacity:](self->_dodgeRingLayer, "setOpacity:", v9);
  +[CATransaction commit](CATransaction, "commit");
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectionLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_highlightLuminanceLayer, 0);
  objc_storeStrong((id *)&self->_highlightDodgeLayer, 0);
  objc_storeStrong((id *)&self->_dodgeRingLayer, 0);
  objc_storeStrong((id *)&self->_luminanceRingLayer, 0);
}

@end
