@implementation MCLRatingsView

- (MCLRatingsView)initWithFrame:(CGRect)a3
{
  MCLRatingsView *v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  MCLRatingsView *v9;
  CGRect v10;

  v10 = a3;
  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)MCLRatingsView;
  v9 = -[MCLRatingsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v5 = (id)-[MCLRatingsView layer](v9, "layer");
    objc_msgSend(v5, "setShouldRasterize:", 1);

    -[MCLRatingsView setContentMode:](v9, "setContentMode:", 3);
    v6 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    -[MCLRatingsView setBackgroundColor:](v9, "setBackgroundColor:");

    -[MCLRatingsView setSpacing:](v9, "setSpacing:");
    -[MCLRatingsView setValue:](v9, "setValue:", 0.0);
    v9->_imageaspect = 1.0;
  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (void)setSpacing:(double)a3
{
  -[MCLRatingsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setValue:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 > 5.0)
      self->_value = 5.0;
  }
  else
  {
    self->_value = 0.0;
  }
  if (a3 != self->_value)
  {
    self->_value = a3;
    -[MCLRatingsView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEmptyImage:(id)a3
{
  id location[2];
  MCLRatingsView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_emptyImage, location[0]);
  -[MCLRatingsView setNeedsDisplay](v4, "setNeedsDisplay");
  objc_storeStrong(location, 0);
}

- (void)setFullImage:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id location[2];
  MCLRatingsView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && (objc_msgSend(location[0], "size"), v3 > 0.0))
  {
    objc_storeStrong((id *)&v8->_fullImage, location[0]);
    objc_msgSend(location[0], "size");
    v6 = v4;
    objc_msgSend(location[0], "size");
    v8->_imageaspect = v6 / v5;
  }
  else
  {
    v8->_imageaspect = 1.0;
  }
  -[MCLRatingsView setNeedsUpdateConstraints](v8, "setNeedsUpdateConstraints");
  -[MCLRatingsView setNeedsDisplay](v8, "setNeedsDisplay");
  objc_storeStrong(location, 0);
}

- (void)updateConstraints
{
  objc_super v2;
  id v3[2];
  MCLRatingsView *v4;

  v4 = self;
  v3[1] = (id)a2;
  if (self->_widthConstraint)
    -[NSLayoutConstraint setActive:](v4->_widthConstraint, "setActive:", 0);
  v3[0] = (id)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, v4, 8, 5.0 * v4->_imageaspect, 5.0 * v4->_spacing);
  objc_msgSend(v3[0], "setActive:", 1);
  objc_storeStrong((id *)&v4->_widthConstraint, v3[0]);
  v2.receiver = v4;
  v2.super_class = (Class)MCLRatingsView;
  -[MCLRatingsView updateConstraints](&v2, sel_updateConstraints);
  objc_storeStrong(v3, 0);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect rect;
  int i;
  CGRect v12;
  CGContext *CurrentContext;

  if (self->_fullImage)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[MCLRatingsView bounds](self, "bounds");
    v12.origin.x = v3;
    v12.origin.y = v4;
    v12.size.height = v5;
    v12.size.width = v5 * self->_imageaspect;
    for (i = 1; i <= 5; ++i)
    {
      if (self->_value < (double)i)
      {
        -[UIImage drawInRect:](self->_emptyImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
        if (self->_value > (double)(i - 1))
        {
          CGRectMake_0();
          rect.origin.x = v6;
          rect.origin.y = v7;
          rect.size.width = v8;
          rect.size.height = v9;
          CGContextSaveGState(CurrentContext);
          UIRectClip(rect);
          -[UIImage drawInRect:](self->_fullImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
          CGContextRestoreGState(CurrentContext);
        }
      }
      else
      {
        -[UIImage drawInRect:](self->_fullImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
      }
      v12.origin.x = CGRectGetMaxX(v12) + self->_spacing;
    }
  }
}

- (double)spacing
{
  return self->_spacing;
}

- (double)value
{
  return self->_value;
}

- (UIImage)emptyImage
{
  return self->_emptyImage;
}

- (UIImage)fullImage
{
  return self->_fullImage;
}

- (BOOL)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(BOOL)a3
{
  self->_actionVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullImage, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
}

@end
