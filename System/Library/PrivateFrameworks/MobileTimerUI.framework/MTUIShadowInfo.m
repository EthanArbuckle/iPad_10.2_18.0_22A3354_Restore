@implementation MTUIShadowInfo

- (MTUIShadowInfo)initWithColor:(id)a3 radius:(double)a4 offset:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  id v11;
  MTUIShadowInfo *v12;
  MTUIShadowInfo *v13;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTUIShadowInfo;
  v12 = -[MTUIShadowInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MTUIShadowInfo setColor:](v12, "setColor:", v11);
    -[MTUIShadowInfo setRadius:](v13, "setRadius:", a4);
    -[MTUIShadowInfo setOffset:](v13, "setOffset:", width, height);
    -[MTUIShadowInfo setScale:](v13, "setScale:", a6);
  }

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
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

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
