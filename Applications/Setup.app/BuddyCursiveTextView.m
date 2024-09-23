@implementation BuddyCursiveTextView

- (BuddyCursiveTextView)init
{
  BuddyCursiveTextView *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCursiveTextView;
  location = -[BuddyCursiveTextView init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    objc_msgSend(location, "configure");
  v2 = (BuddyCursiveTextView *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyCursiveTextView)initWithFrame:(CGRect)a3
{
  BuddyCursiveTextView *v3;
  objc_super v5;
  SEL v6;
  id location;
  CGRect v8;

  v8 = a3;
  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyCursiveTextView;
  location = -[BuddyCursiveTextView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
    objc_msgSend(location, "configure");
  v3 = (BuddyCursiveTextView *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)configure
{
  CAShapeLayer *v2;
  CAShapeLayer *textLayer;
  CAShapeLayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CAShapeLayer *v10;
  double v11;
  double v12;
  id v13;

  v2 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  textLayer = self->_textLayer;
  self->_textLayer = v2;

  v4 = self->_textLayer;
  -[BuddyCursiveTextView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](v4, "setFrame:", v5, v6, v7, v8);
  -[CAShapeLayer setShadowRadius:](self->_textLayer, "setShadowRadius:", 1.0);
  LODWORD(v9) = 1036831949;
  -[CAShapeLayer setShadowOpacity:](self->_textLayer, "setShadowOpacity:", v9);
  v10 = self->_textLayer;
  v11 = sub_100079738();
  -[CAShapeLayer setShadowOffset:](v10, "setShadowOffset:", v11, v12, *(_QWORD *)&v11, *(_QWORD *)&v12);
  v13 = -[BuddyCursiveTextView layer](self, "layer");
  objc_msgSend(v13, "addSublayer:", self->_textLayer);

}

- (void)layoutSubviews
{
  CAShapeLayer *textLayer;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  SEL v8;
  BuddyCursiveTextView *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCursiveTextView;
  -[BuddyCursiveTextView layoutSubviews](&v7, "layoutSubviews");
  textLayer = v9->_textLayer;
  -[BuddyCursiveTextView bounds](v9, "bounds");
  -[CAShapeLayer setFrame:](textLayer, "setFrame:", v3, v4, v5, v6, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v6);
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  BuddyCursiveTextPath *v5;
  BuddyCursiveTextPath *v6;
  BuddyCursiveTextPath *textPath;
  CGAffineTransform *p_textTransform;
  BuddyCursiveTextPath *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE __b[48];
  double v15;
  id location[2];
  BuddyCursiveTextView *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v5 = [BuddyCursiveTextPath alloc];
  v6 = -[BuddyCursiveTextPath initWithURL:](v5, "initWithURL:", location[0]);
  textPath = v17->_textPath;
  v17->_textPath = v6;

  if (v17->_textPath)
  {
    p_textTransform = &v17->_textTransform;
    v9 = v17->_textPath;
    -[CAShapeLayer bounds](v17->_textLayer, "bounds");
    if (v9)
      -[BuddyCursiveTextPath transformForRect:pointSize:flipped:](v9, "transformForRect:pointSize:flipped:", 1, v10, v11, v12, v13, v15);
    else
      memset(__b, 0, sizeof(__b));
    memcpy(p_textTransform, __b, sizeof(CGAffineTransform));
  }
  objc_storeStrong(location, 0);
}

- (double)duration
{
  double result;

  -[BuddyCursiveTextPath duration](self->_textPath, "duration", a2, self);
  return result;
}

- (void)setTime:(float)a3
{
  const CGPath *CopyByTransformingPath;
  CGPath *path;

  path = -[BuddyCursiveTextPath pathForTime:](self->_textPath, "pathForTime:", a3);
  CopyByTransformingPath = CGPathCreateCopyByTransformingPath(path, &self->_textTransform);
  -[CAShapeLayer setPath:](self->_textLayer, "setPath:", CopyByTransformingPath);
  -[CAShapeLayer setShadowPath:](self->_textLayer, "setShadowPath:", CopyByTransformingPath);
  CGPathRelease(CopyByTransformingPath);
  CGPathRelease(path);
}

- (void)setFillColor:(id)a3
{
  id location[2];
  BuddyCursiveTextView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CAShapeLayer setFillColor:](v4->_textLayer, "setFillColor:", objc_msgSend(objc_retainAutorelease(location[0]), "CGColor"));
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_super v3;
  id location[2];
  BuddyCursiveTextView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyCursiveTextView;
  -[BuddyCursiveTextView setAccessibilityLabel:](&v3, "setAccessibilityLabel:", location[0]);
  -[BuddyCursiveTextPath setAccessibilityLabel:](v5->_textPath, "setAccessibilityLabel:", location[0]);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPath, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
}

@end
