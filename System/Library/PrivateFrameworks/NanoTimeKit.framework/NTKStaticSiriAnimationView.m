@implementation NTKStaticSiriAnimationView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKStaticSiriAnimationView initWithFrame:forDevice:](self, "initWithFrame:forDevice:", a3, 0.0, 0.0, 44.0, 44.0);
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return 0;
}

- (NTKStaticSiriAnimationView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NTKStaticSiriAnimationView *v11;
  NTKStaticSiriAnimationView *v12;
  id v13;
  void *v14;
  uint64_t v15;
  UIImageView *imageView;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKStaticSiriAnimationView;
  v11 = -[NTKStaticSiriAnimationView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v13 = objc_alloc(MEMORY[0x1E0DC3890]);
    NTKImageNamed(CFSTR("SiriHero"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithImage:", v14);
    imageView = v12->_imageView;
    v12->_imageView = (UIImageView *)v15;

    -[NTKStaticSiriAnimationView addSubview:](v12, "addSubview:", v12->_imageView);
  }

  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[CLKDevice sizeClass](self->_device, "sizeClass", a3.width, a3.height);
  v4 = 33.0;
  if (!v3)
    v4 = 28.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  -[NTKStaticSiriAnimationView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  MEMORY[0x1BCCA72B8](-[NTKStaticSiriAnimationView bounds](self, "bounds"));
  -[UIImageView setCenter:](self->_imageView, "setCenter:");
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
