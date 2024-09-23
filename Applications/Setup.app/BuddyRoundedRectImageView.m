@implementation BuddyRoundedRectImageView

- (BuddyRoundedRectImageView)initWithFrame:(CGRect)a3
{
  id v3;
  void *v4;
  BuddyRoundedRectImageView *v5;
  objc_super v7;
  SEL v8;
  id location;
  CGRect v10;

  v10 = a3;
  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyRoundedRectImageView;
  location = -[BuddyRoundedRectImageView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v4 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v3;

    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 1));
  }
  v5 = (BuddyRoundedRectImageView *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (BuddyRoundedRectImageView)initWithImage:(id)a3
{
  id v3;
  BuddyRoundedRectImageView *v4;
  id location[2];
  id v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v7, v7);
  if (v7)
    objc_msgSend(*((id *)v7 + 1), "setImage:", location[0]);
  v4 = (BuddyRoundedRectImageView *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (void)setImage:(id)a3
{
  id location[2];
  BuddyRoundedRectImageView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIImageView setImage:](v4->_imageView, "setImage:", location[0]);
  objc_storeStrong(location, 0);
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image", a2, self);
}

- (void)setUsesMask:(BOOL)a3
{
  double v3;
  id v4;
  id v5;

  if (self->_usesMask != a3)
  {
    self->_usesMask = a3;
    if (self->_usesMask)
    {
      v3 = UIRoundToViewScale(0, 9.5);
      v4 = -[BuddyRoundedRectImageView layer](self, "layer");
      objc_msgSend(v4, "setCornerRadius:", v3);

      -[BuddyRoundedRectImageView setClipsToBounds:](self, "setClipsToBounds:", 1);
    }
    else
    {
      v5 = -[BuddyRoundedRectImageView layer](self, "layer");
      objc_msgSend(v5, "setCornerRadius:", 0.0);

      -[BuddyRoundedRectImageView setClipsToBounds:](self, "setClipsToBounds:", 0);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height, a2, self, *(_QWORD *)&a3.width, *(_QWORD *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;

  -[BuddyRoundedRectImageView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v2, v3, v4, v5, *(_QWORD *)&v2, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v2, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v2, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5);
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
