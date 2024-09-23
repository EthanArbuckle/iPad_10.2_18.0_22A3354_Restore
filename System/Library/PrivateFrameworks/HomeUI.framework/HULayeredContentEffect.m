@implementation HULayeredContentEffect

+ (id)contentWithVibrancyEffect:(id)a3
{
  id v3;
  HULayeredContentEffect *v4;

  v3 = a3;
  v4 = objc_alloc_init(HULayeredContentEffect);
  -[HULayeredContentEffect setVibrancyEffect:](v4, "setVibrancyEffect:", v3);

  return v4;
}

+ (id)contentWithTintColor:(id)a3
{
  id v3;
  HULayeredContentEffect *v4;

  v3 = a3;
  v4 = objc_alloc_init(HULayeredContentEffect);
  -[HULayeredContentEffect setTintColor:](v4, "setTintColor:", v3);

  return v4;
}

- (UIVibrancyEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (void)setVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyEffect, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
}

@end
