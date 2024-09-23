@implementation PHRingView

+ (id)ringImageCache
{
  if (qword_1002DCB28 != -1)
    dispatch_once(&qword_1002DCB28, &stru_100286F38);
  return (id)qword_1002DCB20;
}

- (id)ringImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5 cacheIdentifier:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHRingView ringImageCache](PHRingView, "ringImageCache"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

  if (!v13)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHRingView _createRingImageWithSize:strokeWidth:color:](PHRingView, "_createRingImageWithSize:strokeWidth:color:", v10, width, height, a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PHRingView ringImageCache](PHRingView, "ringImageCache"));
    objc_msgSend(v14, "setObject:forKey:", v13, v11);

  }
  return v13;
}

+ (id)_createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height;
  double width;
  id v8;
  double x;
  double y;
  double v11;
  double v12;
  void *v13;
  void *v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGRect v18;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectInset(v18, a4, a4);
  x = v19.origin.x;
  y = v19.origin.y;
  v11 = v19.size.width;
  v12 = v19.size.height;
  v19.origin.x = width;
  v19.origin.y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v19.origin, 0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, height));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, y, v11, v12));
  objc_msgSend(v13, "appendPath:", v14);

  objc_msgSend(v13, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v8, "setFill");

  objc_msgSend(v13, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v16;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;

  if (self->__selected != a3)
  {
    v3 = a3;
    +[CATransaction begin](CATransaction, "begin");
    LODWORD(v5) = 1043207291;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

    LODWORD(v7) = 0;
    if (v3)
    {
      -[CALayer setOpacity:](self->_highlightDodgeLayer, "setOpacity:", v7);
      LODWORD(v7) = 1.0;
    }
    -[CALayer setOpacity:](self->_selectionLayer, "setOpacity:", v7);
    +[CATransaction commit](CATransaction, "commit");
    self->__selected = v3;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;
  float v8;
  double v9;

  if (self->__highlighted != a3)
  {
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
    self->__highlighted = v3;
  }
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
  v10.super_class = (Class)PHRingView;
  -[PHRingView setUserInteractionEnabled:](&v10, "setUserInteractionEnabled:");
  if (self->__enabled != v3)
  {
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
    self->__enabled = v3;
  }
}

- (PHRingView)initWithFrame:(CGRect)a3
{
  return -[PHRingView initWithFrame:reuseIdentifier:](self, "initWithFrame:reuseIdentifier:", CFSTR("Generic"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PHRingView)initWithFrame:(CGRect)a3 reuseIdentifier:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PHRingView *v10;
  PHRingView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CALayer *luminanceRingLayer;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CALayer *dodgeRingLayer;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CALayer *highlightDodgeLayer;
  id v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  CALayer *highlightLuminanceLayer;
  id v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  CALayer *selectionLayer;
  id v45;
  double v46;
  void *v47;
  objc_super v49;
  CGRect v50;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)PHRingView;
  v10 = -[PHRingView initWithFrame:](&v49, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[PHRingView setRingSize:](v10, "setRingSize:", width, height);
    -[PHRingView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    -[PHRingView setOpaque:](v11, "setOpaque:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHRingView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

    v11->__enabled = 1;
    v11->__selected = 0;
    v11->__highlighted = 0;
    v15 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    luminanceRingLayer = v11->_luminanceRingLayer;
    v11->_luminanceRingLayer = (CALayer *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-luminance"), v9));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PHRingView ringImageWithSize:strokeWidth:color:cacheIdentifier:](v11, "ringImageWithSize:strokeWidth:color:cacheIdentifier:", v17, v18, width, height, 1.5)));
    -[CALayer setContents:](v11->_luminanceRingLayer, "setContents:", objc_msgSend(v19, "CGImage"));

    v20 = kCAFilterPlusL;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    -[CALayer setCompositingFilter:](v11->_luminanceRingLayer, "setCompositingFilter:", v21);

    -[CALayer setFrame:](v11->_luminanceRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v22, "addSublayer:", v11->_luminanceRingLayer);

    v23 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    dodgeRingLayer = v11->_dodgeRingLayer;
    v11->_dodgeRingLayer = (CALayer *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-dodge"), v9));
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PHRingView ringImageWithSize:strokeWidth:color:cacheIdentifier:](v11, "ringImageWithSize:strokeWidth:color:cacheIdentifier:", v25, v26, width, height, 1.5)));
    -[CALayer setContents:](v11->_dodgeRingLayer, "setContents:", objc_msgSend(v27, "CGImage"));

    v28 = kCAFilterColorDodgeBlendMode;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorDodgeBlendMode));
    -[CALayer setCompositingFilter:](v11->_dodgeRingLayer, "setCompositingFilter:", v29);

    -[CALayer setFrame:](v11->_dodgeRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v30, "addSublayer:", v11->_dodgeRingLayer);

    v31 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightDodgeLayer = v11->_highlightDodgeLayer;
    v11->_highlightDodgeLayer = (CALayer *)v31;

    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0)));
    -[CALayer setBackgroundColor:](v11->_highlightDodgeLayer, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v28));
    -[CALayer setCompositingFilter:](v11->_highlightDodgeLayer, "setCompositingFilter:", v34);

    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.width = width;
    v50.size.height = height;
    v51 = CGRectInset(v50, 1.5, 1.5);
    -[CALayer setFrame:](v11->_highlightDodgeLayer, "setFrame:", 1.5, 1.5, v51.size.width, v51.size.height);
    -[CALayer setCornerRadius:](v11->_highlightDodgeLayer, "setCornerRadius:", (width + -1.5) * 0.5 + -0.5);
    LODWORD(v35) = 0;
    -[CALayer setOpacity:](v11->_highlightDodgeLayer, "setOpacity:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v36, "addSublayer:", v11->_highlightDodgeLayer);

    v37 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightLuminanceLayer = v11->_highlightLuminanceLayer;
    v11->_highlightLuminanceLayer = (CALayer *)v37;

    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007)));
    -[CALayer setBackgroundColor:](v11->_highlightLuminanceLayer, "setBackgroundColor:", objc_msgSend(v39, "CGColor"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v20));
    -[CALayer setCompositingFilter:](v11->_highlightLuminanceLayer, "setCompositingFilter:", v40);

    -[CALayer frame](v11->_highlightDodgeLayer, "frame");
    -[CALayer setFrame:](v11->_highlightLuminanceLayer, "setFrame:");
    -[CALayer cornerRadius](v11->_highlightDodgeLayer, "cornerRadius");
    -[CALayer setCornerRadius:](v11->_highlightLuminanceLayer, "setCornerRadius:");
    LODWORD(v41) = 0;
    -[CALayer setOpacity:](v11->_highlightLuminanceLayer, "setOpacity:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v42, "insertSublayer:below:", v11->_highlightLuminanceLayer, v11->_highlightDodgeLayer);

    v43 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    selectionLayer = v11->_selectionLayer;
    v11->_selectionLayer = (CALayer *)v43;

    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v11->_selectionLayer, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));

    -[CALayer setFrame:](v11->_selectionLayer, "setFrame:", 0.0, 0.0, width, height);
    -[CALayer setCornerRadius:](v11->_selectionLayer, "setCornerRadius:", width * 0.5);
    LODWORD(v46) = 0;
    -[CALayer setOpacity:](v11->_selectionLayer, "setOpacity:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingView layer](v11, "layer"));
    objc_msgSend(v47, "addSublayer:", v11->_selectionLayer);

  }
  return v11;
}

- (CGSize)ringSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_ringSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRingSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_ringSize, &v3, 16, 1, 0);
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSelectionLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)_selected
{
  return self->__selected;
}

- (void)set_selected:(BOOL)a3
{
  self->__selected = a3;
}

- (BOOL)_highlighted
{
  return self->__highlighted;
}

- (void)set_highlighted:(BOOL)a3
{
  self->__highlighted = a3;
}

- (BOOL)_enabled
{
  return self->__enabled;
}

- (void)set_enabled:(BOOL)a3
{
  self->__enabled = a3;
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
