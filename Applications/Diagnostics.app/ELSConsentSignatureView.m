@implementation ELSConsentSignatureView

- (ELSConsentSignatureView)initWithCoder:(id)a3
{
  ELSConsentSignatureView *v3;
  ELSConsentSignatureView *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ELSConsentSignatureView;
  v3 = -[ELSConsentSignatureView initWithCoder:](&v11, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 1.0;
    v3->_lineWidthVariation = 3.0;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v7, "setBorderColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 10.0);

    -[ELSConsentSignatureView makeSignatureGestureRecognizer](v4, "makeSignatureGestureRecognizer");
  }
  return v4;
}

- (ELSConsentSignatureView)initWithFrame:(CGRect)a3
{
  ELSConsentSignatureView *v3;
  ELSConsentSignatureView *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ELSConsentSignatureView;
  v3 = -[ELSConsentSignatureView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 1.0;
    v3->_lineWidthVariation = 3.0;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v7, "setBorderColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView layer](v4, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 10.0);

    -[ELSConsentSignatureView makeSignatureGestureRecognizer](v4, "makeSignatureGestureRecognizer");
  }
  return v4;
}

- (id)pathWithRoundedStyle
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v3, "setLineCapStyle:", 1);
  -[ELSConsentSignatureView lineWidth](self, "lineWidth");
  objc_msgSend(v3, "setLineWidth:");
  objc_msgSend(v3, "setLineJoinStyle:", 1);
  return v3;
}

- (void)makeSignatureGestureRecognizer
{
  UIGestureRecognizer *v3;
  UIGestureRecognizer *signatureGestureRecognizer;

  if (!self->_signatureGestureRecognizer)
  {
    v3 = (UIGestureRecognizer *)objc_opt_new(ORKSignatureGestureRecognizer, a2);
    signatureGestureRecognizer = self->_signatureGestureRecognizer;
    self->_signatureGestureRecognizer = v3;

    -[UIGestureRecognizer setEventDelegate:](self->_signatureGestureRecognizer, "setEventDelegate:", self);
    -[ELSConsentSignatureView addGestureRecognizer:](self, "addGestureRecognizer:", self->_signatureGestureRecognizer);
  }
}

- (UIColor)lineColor
{
  UIColor *lineColor;
  UIColor *v4;
  UIColor *v5;

  lineColor = self->_lineColor;
  if (!lineColor)
  {
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v5 = self->_lineColor;
    self->_lineColor = v4;

    lineColor = self->_lineColor;
  }
  return lineColor;
}

- (NSMutableArray)pathArray
{
  NSMutableArray *pathArray;
  NSMutableArray *v4;
  NSMutableArray *v5;

  pathArray = self->_pathArray;
  if (!pathArray)
  {
    v4 = (NSMutableArray *)objc_opt_new(NSMutableArray, a2);
    v5 = self->_pathArray;
    self->_pathArray = v4;

    pathArray = self->_pathArray;
  }
  return pathArray;
}

- (double)placeholderPoint
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[ELSConsentSignatureView bounds](self, "bounds");
  v3 = v2 * 0.7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  objc_msgSend(v4, "pointSize");
  v6 = v3 + -5.0 - v5;
  objc_msgSend(v4, "descender");
  v8 = v6 + v7;

  return v8;
}

- (NSArray)backgroundLines
{
  NSArray *backgroundLines;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  NSArray *v10;
  NSArray *v11;
  void *v13;

  backgroundLines = self->_backgroundLines;
  if (!backgroundLines)
  {
    -[ELSConsentSignatureView bounds](self, "bounds");
    v5 = v4;
    -[ELSConsentSignatureView bounds](self, "bounds");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    v9 = v7 * 0.7;
    objc_msgSend(v8, "moveToPoint:", 0.0, v9);
    objc_msgSend(v8, "addLineToPoint:", v5, v9);
    v13 = v8;
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v11 = self->_backgroundLines;
    self->_backgroundLines = v10;

    backgroundLines = self->_backgroundLines;
  }
  return backgroundLines;
}

- (BOOL)isForceTouchAvailable
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E54;
  block[3] = &unk_100132838;
  block[4] = self;
  if (qword_10016E8A8 != -1)
    dispatch_once(&qword_10016E8A8, block);
  return byte_10016E8A0;
}

- (BOOL)isTouchTypeStylus:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_respondsToSelector(v3, "type") & 1) != 0 && objc_msgSend(v3, "type") == (id)2;

  return v4;
}

- (void)gestureTouchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGPoint *p_currentPoint;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  int *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathWithRoundedStyle](self, "pathWithRoundedStyle"));
  -[ELSConsentSignatureView setCurrentPath:](self, "setCurrentPath:", v8);

  -[ELSConsentSignatureView setNeedsDisplay](self, "setNeedsDisplay");
  objc_msgSend(v21, "previousLocationInView:", self);
  self->previousPoint1.x = v9;
  self->previousPoint1.y = v10;
  objc_msgSend(v21, "previousLocationInView:", self);
  self->previousPoint2.x = v11;
  self->previousPoint2.y = v12;
  p_currentPoint = &self->currentPoint;
  objc_msgSend(v21, "locationInView:", self);
  self->currentPoint.x = v14;
  self->currentPoint.y = v15;
  if (-[ELSConsentSignatureView isForceTouchAvailable](self, "isForceTouchAvailable")
    || -[ELSConsentSignatureView isTouchTypeStylus:](self, "isTouchTypeStylus:", v21))
  {
    self->minPressure = 0.0;
    objc_msgSend(v21, "maximumPossibleForce");
    v17 = v16 * 0.5;
    v18 = &OBJC_IVAR___ELSConsentSignatureView_maxPressure;
  }
  else
  {
    self->minPressure = 0.0;
    self->maxPressure = 9.0;
    objc_msgSend(v21, "timestamp");
    v18 = &OBJC_IVAR___ELSConsentSignatureView_previousTouchTime;
  }
  *(double *)((char *)&self->super.super.super.isa + *v18) = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
  objc_msgSend(v19, "moveToPoint:", p_currentPoint->x, self->currentPoint.y);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
  objc_msgSend(v20, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, p_currentPoint->x, self->currentPoint.y, 0.1, 0.0, 6.28318531);

  -[ELSConsentSignatureView gestureTouchesMoved:withEvent:](self, "gestureTouchesMoved:withEvent:", v7, v6);
}

- (void)gestureTouchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  CGPoint *p_currentPoint;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double maxPressure;
  double v14;
  double v15;
  double minPressure;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double y;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  double x;
  double v48;
  double width;
  double height;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  float64x2_t v64;
  id v65;
  CGRect BoundingBox;

  v65 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  objc_msgSend(v6, "locationInView:", self);
  p_currentPoint = &self->currentPoint;
  v10 = (v9 - self->currentPoint.y) * (v9 - self->currentPoint.y)
      + (v8 - self->currentPoint.x) * (v8 - self->currentPoint.x);
  if (v10 >= 25.0)
  {
    if (-[ELSConsentSignatureView isForceTouchAvailable](self, "isForceTouchAvailable")
      || -[ELSConsentSignatureView isTouchTypeStylus:](self, "isTouchTypeStylus:", v6))
    {
      objc_msgSend(v6, "force");
      v12 = v11;
    }
    else
    {
      maxPressure = self->maxPressure;
      objc_msgSend(v65, "timestamp");
      v12 = maxPressure - log(sqrt(v10) / fmax(v14 - self->previousTouchTime, 0.0001));
      objc_msgSend(v65, "timestamp");
      self->previousTouchTime = v15;
    }
    minPressure = self->minPressure;
    if (minPressure < v12)
      minPressure = v12;
    if (self->maxPressure >= minPressure)
      v17 = minPressure;
    else
      v17 = self->maxPressure;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
    objc_msgSend(v18, "lineWidth");
    v20 = v19;

    v21 = v17 - self->minPressure;
    -[ELSConsentSignatureView lineWidthVariation](self, "lineWidthVariation");
    v23 = v21 * v22 / (self->maxPressure - self->minPressure);
    -[ELSConsentSignatureView lineWidth](self, "lineWidth");
    v25 = v24 + v23;
    v26 = v20 - v25;
    if (v20 - v25 < 0.0)
      v26 = -(v20 - v25);
    if (v26 < 0.25)
      goto LABEL_20;
    if (v25 <= v20)
    {
      if (v25 >= v20)
      {
LABEL_19:
        -[ELSConsentSignatureView commitCurrentPath](self, "commitCurrentPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathWithRoundedStyle](self, "pathWithRoundedStyle"));
        -[ELSConsentSignatureView setCurrentPath:](self, "setCurrentPath:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v29, "setLineWidth:", v20);

        __asm { FMOV            V1.2D, #0.5 }
        v64 = vmulq_f64(vaddq_f64(*(float64x2_t *)p_currentPoint, (float64x2_t)self->previousPoint1), _Q1);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v35, "moveToPoint:", *(_OWORD *)&v64);

LABEL_20:
        self->previousPoint2 = self->previousPoint1;
        objc_msgSend(v6, "previousLocationInView:", self);
        self->previousPoint1.x = v36;
        self->previousPoint1.y = v37;
        objc_msgSend(v6, "locationInView:", self);
        p_currentPoint->x = v38;
        self->currentPoint.y = v39;
        y = self->previousPoint1.y;
        v41 = (self->previousPoint1.x + self->previousPoint2.x) * 0.5;
        v42 = (y + self->previousPoint2.y) * 0.5;
        v43 = (v38 + self->previousPoint1.x) * 0.5;
        v44 = (y + v39) * 0.5;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
        objc_msgSend(v45, "moveToPoint:", v41, v42);
        objc_msgSend(v45, "addQuadCurveToPoint:controlPoint:", v43, v44, self->previousPoint1.x, self->previousPoint1.y);
        v46 = objc_retainAutorelease(v45);
        BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v46, "CGPath"));
        x = BoundingBox.origin.x;
        v48 = BoundingBox.origin.y;
        width = BoundingBox.size.width;
        height = BoundingBox.size.height;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v43, v44, self->previousPoint1.x, self->previousPoint1.y);

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v52, "lineWidth");
        v54 = x - v53 * 2.0;

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v55, "lineWidth");
        v57 = v48 - v56 * 2.0;

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v58, "lineWidth");
        v60 = width + v59 * 4.0;

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
        objc_msgSend(v61, "lineWidth");
        v63 = height + v62 * 4.0;

        -[ELSConsentSignatureView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v54, v57, v60, v63);
        goto LABEL_21;
      }
      v27 = -0.25;
    }
    else
    {
      v27 = 0.25;
    }
    v20 = v20 + v27;
    goto LABEL_19;
  }
LABEL_21:

}

- (void)commitCurrentPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 != CGSizeZero.width || v7 != CGSizeZero.height)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
    objc_msgSend(v9, "addObject:", v10);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView delegate](self, "delegate"));
    objc_msgSend(v11, "didEdit:", self);

  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  CGContext *CurrentContext;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v8, "setFill");

  CurrentContext = UIGraphicsGetCurrentContext();
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGContextFillRect(CurrentContext, v24);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView lineColor](self, "lineColor"));
        objc_msgSend(v16, "setStroke");

        objc_msgSend(v15, "stroke");
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView lineColor](self, "lineColor"));
  objc_msgSend(v17, "setStroke");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));
  objc_msgSend(v18, "stroke");

}

- (NSArray)signaturePath
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setSignaturePath:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *pathArray;

  if (a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    pathArray = self->_pathArray;
    self->_pathArray = v4;

    -[ELSConsentSignatureView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)signatureImage
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  CGSize v18;

  -[ELSConsentSignatureView signatureImageSize](self, "signatureImageSize");
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.85);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView lineColor](self, "lineColor"));
        objc_msgSend(v9, "setStroke");

        objc_msgSend(v8, "stroke");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v11;
}

- (BOOL)signatureExists
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)clear
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView currentPath](self, "currentPath"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathWithRoundedStyle](self, "pathWithRoundedStyle"));
      -[ELSConsentSignatureView setCurrentPath:](self, "setCurrentPath:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ELSConsentSignatureView pathArray](self, "pathArray"));
    objc_msgSend(v7, "removeAllObjects");

    -[ELSConsentSignatureView bounds](self, "bounds");
    -[ELSConsentSignatureView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  }
}

- (CGSize)signatureImageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ELSConsentSignatureView frame](self, "frame");
  if (v3 == 0.0)
  {
    v7 = 175.0;
  }
  else
  {
    -[ELSConsentSignatureView frame](self, "frame");
    v5 = 175.0 / v4;
    -[ELSConsentSignatureView frame](self, "frame");
    v7 = v6 * v5;
  }
  v8 = 175.0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)lineWidthVariation
{
  return self->_lineWidthVariation;
}

- (void)setLineWidthVariation:(double)a3
{
  self->_lineWidthVariation = a3;
}

- (ELSConsentSignatureViewDelegate)delegate
{
  return (ELSConsentSignatureViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIGestureRecognizer)signatureGestureRecognizer
{
  return self->_signatureGestureRecognizer;
}

- (void)setSignatureGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_signatureGestureRecognizer, a3);
}

- (UIBezierPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentPath, a3);
}

- (void)setPathArray:(id)a3
{
  objc_storeStrong((id *)&self->_pathArray, a3);
}

- (void)setBackgroundLines:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLines, 0);
  objc_storeStrong((id *)&self->_pathArray, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_signatureGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
