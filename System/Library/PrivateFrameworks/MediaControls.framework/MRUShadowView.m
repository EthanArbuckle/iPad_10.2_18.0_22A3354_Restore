@implementation MRUShadowView

- (MRUShadowView)initWithFrame:(CGRect)a3
{
  MRUShadowView *v3;
  MRUShadowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUShadowView;
  v3 = -[MRUShadowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUShadowView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);

    -[MRUShadowView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)setColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[MRUShadowView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

}

- (void)setCompositingFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRUShadowView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v4);

}

- (void)setOffset:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[MRUShadowView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", width, height);

}

- (void)setRadius:(double)a3
{
  id v4;

  -[MRUShadowView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowRadius:", a3);

}

- (void)setOpacity:(float)a3
{
  double v4;
  id v5;

  -[MRUShadowView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUShadowView;
  if (-[MRUShadowView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("shadow"));

  return v5;
}

- (UIColor)color
{
  return self->_color;
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  width = self->_offset.width;
  height = self->_offset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (float)opacity
{
  return self->_opacity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
