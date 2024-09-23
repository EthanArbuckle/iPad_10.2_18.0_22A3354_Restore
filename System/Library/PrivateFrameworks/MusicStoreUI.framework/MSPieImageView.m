@implementation MSPieImageView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSPieImageView;
  -[MSPieImageView dealloc](&v3, sel_dealloc);
}

- (void)setBackgroundImage:(id)a3
{
  UIImage *backgroundImage;

  backgroundImage = self->_backgroundImage;
  if (backgroundImage != a3)
  {

    self->_backgroundImage = (UIImage *)a3;
    -[MSPieImageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setForegroundImage:(id)a3
{
  UIImage *foregroundImage;

  foregroundImage = self->_foregroundImage;
  if (foregroundImage != a3)
  {

    self->_foregroundImage = (UIImage *)a3;
    -[MSPieImageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setPieFraction:(double)a3
{
  if (self->_pieFraction != a3)
  {
    self->_pieFraction = a3;
    -[MSPieImageView _reloadClipPath](self, "_reloadClipPath");
  }
}

- (void)setPieRadius:(double)a3
{
  if (self->_pieRadius != a3)
  {
    self->_pieRadius = a3;
    -[MSPieImageView _reloadClipPath](self, "_reloadClipPath");
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
  UIBezierPath *clipPath;
  double pieFraction;
  double v14;
  double v15;
  double v16;
  UIBezierPath *v17;

  -[MSPieImageView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:");
  clipPath = self->_clipPath;
  if (!clipPath)
  {
    pieFraction = self->_pieFraction;
    if (pieFraction <= 0.00000011920929)
    {
      clipPath = 0;
    }
    else
    {
      v14 = ceil(v9 * 0.5);
      v15 = ceil(v11 * 0.5);
      v16 = pieFraction * 360.0 + -90.0;
      v17 = (UIBezierPath *)(id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
      self->_clipPath = v17;
      -[UIBezierPath moveToPoint:](v17, "moveToPoint:", v14, v15);
      -[UIBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self->_clipPath, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v14, v15, self->_pieRadius, -1.57079633, v16 * 0.0174532925);
      clipPath = self->_clipPath;
    }
  }
  -[UIBezierPath clip](clipPath, "clip");
  -[UIImage drawInRect:](self->_foregroundImage, "drawInRect:", v5, v7, v9, v11);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MSPieImageView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MSPieImageView;
  -[MSPieImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    if (self->_clipPath)
      -[MSPieImageView _reloadClipPath](self, "_reloadClipPath");
  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIImage *backgroundImage;
  double v10;
  double v11;

  -[MSPieImageView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  backgroundImage = self->_backgroundImage;
  if (backgroundImage || (backgroundImage = self->_foregroundImage) != 0)
  {
    -[UIImage size](backgroundImage, "size");
    v3 = v10;
    v4 = v11;
  }
  -[MSPieImageView setFrame:](self, "setFrame:", v6, v8, v3, v4);
}

- (void)_reloadClipPath
{

  self->_clipPath = 0;
  -[MSPieImageView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (UIImage)foregroundImage
{
  return self->_foregroundImage;
}

- (double)pieFraction
{
  return self->_pieFraction;
}

- (double)pieRadius
{
  return self->_pieRadius;
}

@end
