@implementation PHRingHighlightView

+ (CGSize)ringSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (unint64_t)objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 480.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 1024.0;
  *(double *)&v8 = 75.0;
  if (v4 <= v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v10 = (unint64_t)objc_msgSend(v9, "userInterfaceIdiom");

    v8 = *((uint64_t *)&unk_10023F2F0 + ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  }

  v11 = *(double *)&v8;
  v12 = *(double *)&v8;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)ringStroke
{
  return 1.5;
}

+ (double)ringCornerRadius
{
  double v2;

  objc_msgSend((id)objc_opt_class(a1, a2), "ringSize");
  return v2 * 0.5;
}

+ (id)colorForLuminance
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.0500000007);
}

+ (id)colorForDodge
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.600000024, 1.0);
}

+ (id)ringImageForLuminance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)qword_1002DC6D8;
  if (!qword_1002DC6D8)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorForLuminance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9));
    v12 = (void *)qword_1002DC6D8;
    qword_1002DC6D8 = v11;

    v3 = (void *)qword_1002DC6D8;
  }
  return v3;
}

+ (id)ringImageForDodge
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)qword_1002DC6E0;
  if (!qword_1002DC6E0)
  {
    objc_msgSend(a1, "ringSize");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a1, "ringStroke");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "colorForDodge"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9));
    v12 = (void *)qword_1002DC6E0;
    qword_1002DC6E0 = v11;

    v3 = (void *)qword_1002DC6E0;
  }
  return v3;
}

+ (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
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
  objc_msgSend(a1, "ringCornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v14));
  objc_msgSend(a1, "ringCornerRadius");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v16 - a4));
  objc_msgSend(v15, "appendPath:", v17);

  objc_msgSend(v15, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v9, "setFill");

  objc_msgSend(v15, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v19;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  double v7;

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
  double v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHRingHighlightView;
  -[PHRingHighlightView setUserInteractionEnabled:](&v11, "setUserInteractionEnabled:");
  +[CATransaction begin](CATransaction, "begin");
  LODWORD(v5) = 1043207291;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v6, kCATransactionAnimationDuration);

  v8 = 1.0;
  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = flt_10023F2E8[objc_msgSend(v9, "_graphicsQuality") == (id)10];

  }
  *(float *)&v7 = v8;
  -[CALayer setOpacity:](self->_luminanceRingLayer, "setOpacity:", v7);
  *(float *)&v10 = v8;
  -[CALayer setOpacity:](self->_dodgeRingLayer, "setOpacity:", v10);
  +[CATransaction commit](CATransaction, "commit");
}

- (PHRingHighlightView)initWithFrame:(CGRect)a3
{
  PHRingHighlightView *v3;
  PHRingHighlightView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CALayer *luminanceRingLayer;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  void *v20;
  uint64_t v21;
  CALayer *dodgeRingLayer;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  CALayer *highlightDodgeLayer;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  double v41;
  CGFloat v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  uint64_t v46;
  double v47;
  CGFloat v48;
  uint64_t v49;
  double v50;
  CGFloat v51;
  double width;
  double height;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  CALayer *highlightLuminanceLayer;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  double v72;
  void *v73;
  uint64_t v74;
  CALayer *selectionLayer;
  id v76;
  uint64_t v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  double v83;
  void *v84;
  objc_super v86;
  CGRect v87;
  CGRect v88;

  v86.receiver = self;
  v86.super_class = (Class)PHRingHighlightView;
  v3 = -[PHRingHighlightView initWithFrame:](&v86, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHRingHighlightView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PHRingHighlightView setOpaque:](v4, "setOpaque:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHRingHighlightView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    v8 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    luminanceRingLayer = v4->_luminanceRingLayer;
    v4->_luminanceRingLayer = (CALayer *)v8;

    v11 = objc_msgSend((id)objc_opt_class(v4, v10), "ringImageForLuminance");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v11));
    -[CALayer setContents:](v4->_luminanceRingLayer, "setContents:", objc_msgSend(v12, "CGImage"));

    v13 = kCAFilterPlusL;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterPlusL));
    -[CALayer setCompositingFilter:](v4->_luminanceRingLayer, "setCompositingFilter:", v14);

    objc_msgSend((id)objc_opt_class(v4, v15), "ringSize");
    v17 = v16;
    objc_msgSend((id)objc_opt_class(v4, v18), "ringSize");
    -[CALayer setFrame:](v4->_luminanceRingLayer, "setFrame:", 0.0, 0.0, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v20, "addSublayer:", v4->_luminanceRingLayer);

    v21 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    dodgeRingLayer = v4->_dodgeRingLayer;
    v4->_dodgeRingLayer = (CALayer *)v21;

    v24 = objc_msgSend((id)objc_opt_class(v4, v23), "ringImageForDodge");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
    -[CALayer setContents:](v4->_dodgeRingLayer, "setContents:", objc_msgSend(v25, "CGImage"));

    v26 = kCAFilterColorDodgeBlendMode;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorDodgeBlendMode));
    -[CALayer setCompositingFilter:](v4->_dodgeRingLayer, "setCompositingFilter:", v27);

    objc_msgSend((id)objc_opt_class(v4, v28), "ringSize");
    v30 = v29;
    objc_msgSend((id)objc_opt_class(v4, v31), "ringSize");
    -[CALayer setFrame:](v4->_dodgeRingLayer, "setFrame:", 0.0, 0.0, v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v33, "addSublayer:", v4->_dodgeRingLayer);

    v34 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightDodgeLayer = v4->_highlightDodgeLayer;
    v4->_highlightDodgeLayer = (CALayer *)v34;

    v37 = objc_msgSend((id)objc_opt_class(v4, v36), "colorForDodge");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v37));
    -[CALayer setBackgroundColor:](v4->_highlightDodgeLayer, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v26));
    -[CALayer setCompositingFilter:](v4->_highlightDodgeLayer, "setCompositingFilter:", v39);

    objc_msgSend((id)objc_opt_class(v4, v40), "ringSize");
    v42 = v41;
    objc_msgSend((id)objc_opt_class(v4, v43), "ringSize");
    v45 = v44;
    objc_msgSend((id)objc_opt_class(v4, v46), "ringStroke");
    v48 = v47;
    objc_msgSend((id)objc_opt_class(v4, v49), "ringStroke");
    v51 = v50;
    v87.origin.x = 0.0;
    v87.origin.y = 0.0;
    v87.size.width = v42;
    v87.size.height = v45;
    v88 = CGRectInset(v87, v48, v51);
    width = v88.size.width;
    height = v88.size.height;
    objc_msgSend((id)objc_opt_class(v4, v54), "ringStroke");
    v56 = v55;
    objc_msgSend((id)objc_opt_class(v4, v57), "ringStroke");
    -[CALayer setFrame:](v4->_highlightDodgeLayer, "setFrame:", v56, v58, width, height);
    objc_msgSend((id)objc_opt_class(v4, v59), "ringCornerRadius");
    v61 = v60;
    objc_msgSend((id)objc_opt_class(v4, v62), "ringStroke");
    -[CALayer setCornerRadius:](v4->_highlightDodgeLayer, "setCornerRadius:", v61 - v63);
    LODWORD(v64) = 0;
    -[CALayer setOpacity:](v4->_highlightDodgeLayer, "setOpacity:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v65, "addSublayer:", v4->_highlightDodgeLayer);

    v66 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    highlightLuminanceLayer = v4->_highlightLuminanceLayer;
    v4->_highlightLuminanceLayer = (CALayer *)v66;

    v69 = objc_msgSend((id)objc_opt_class(v4, v68), "colorForLuminance");
    v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v69));
    -[CALayer setBackgroundColor:](v4->_highlightLuminanceLayer, "setBackgroundColor:", objc_msgSend(v70, "CGColor"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v13));
    -[CALayer setCompositingFilter:](v4->_highlightLuminanceLayer, "setCompositingFilter:", v71);

    -[CALayer frame](v4->_highlightDodgeLayer, "frame");
    -[CALayer setFrame:](v4->_highlightLuminanceLayer, "setFrame:");
    -[CALayer cornerRadius](v4->_highlightDodgeLayer, "cornerRadius");
    -[CALayer setCornerRadius:](v4->_highlightLuminanceLayer, "setCornerRadius:");
    LODWORD(v72) = 0;
    -[CALayer setOpacity:](v4->_highlightLuminanceLayer, "setOpacity:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v73, "insertSublayer:below:", v4->_highlightLuminanceLayer, v4->_highlightDodgeLayer);

    v74 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    selectionLayer = v4->_selectionLayer;
    v4->_selectionLayer = (CALayer *)v74;

    v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CALayer setBackgroundColor:](v4->_selectionLayer, "setBackgroundColor:", objc_msgSend(v76, "CGColor"));

    objc_msgSend((id)objc_opt_class(v4, v77), "ringSize");
    v79 = v78;
    objc_msgSend((id)objc_opt_class(v4, v80), "ringSize");
    -[CALayer setFrame:](v4->_selectionLayer, "setFrame:", 0.0, 0.0, v79, v81);
    objc_msgSend((id)objc_opt_class(v4, v82), "ringCornerRadius");
    -[CALayer setCornerRadius:](v4->_selectionLayer, "setCornerRadius:");
    LODWORD(v83) = 0;
    -[CALayer setOpacity:](v4->_selectionLayer, "setOpacity:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHRingHighlightView layer](v4, "layer"));
    objc_msgSend(v84, "addSublayer:", v4->_selectionLayer);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(self, a2), "ringSize");
  result.height = v3;
  result.width = v2;
  return result;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_highlightLuminanceLayer, 0);
  objc_storeStrong((id *)&self->_highlightDodgeLayer, 0);
  objc_storeStrong((id *)&self->_dodgeRingLayer, 0);
  objc_storeStrong((id *)&self->_luminanceRingLayer, 0);
}

@end
