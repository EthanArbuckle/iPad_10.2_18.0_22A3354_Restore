@implementation HULayeredBackgroundEffect

+ (id)backgroundWithFillColor:(id)a3
{
  id v3;
  HULayeredBackgroundEffect *v4;

  v3 = a3;
  v4 = objc_alloc_init(HULayeredBackgroundEffect);
  -[HULayeredBackgroundEffect setFillColor:](v4, "setFillColor:", v3);

  return v4;
}

+ (id)backgroundWithBlurEffect:(id)a3
{
  id v3;
  HULayeredBackgroundEffect *v4;

  v3 = a3;
  v4 = objc_alloc_init(HULayeredBackgroundEffect);
  -[HULayeredBackgroundEffect setBlurEffect:](v4, "setBlurEffect:", v3);

  return v4;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
}

@end
