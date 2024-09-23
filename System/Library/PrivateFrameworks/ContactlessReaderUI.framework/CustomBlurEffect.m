@implementation CustomBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CustomBlurEffect;
  objc_msgSendSuper2(&v4, sel_effectWithStyle_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)effectSettings
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CustomBlurEffect;
  -[UIBlurEffect effectSettings](&v5, sel_effectSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.42, 0.42, 0.42, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColorTint:", v3);

  objc_msgSend(v2, "setColorTintAlpha:", 0.35);
  objc_msgSend(v2, "setSaturationDeltaFactor:", 1.0);
  objc_msgSend(v2, "setBlurRadius:", 50.0);
  return v2;
}

- (NSNumber)customBlurRadius
{
  return self->_customBlurRadius;
}

- (void)setCustomBlurRadius:(id)a3
{
  objc_storeStrong((id *)&self->_customBlurRadius, a3);
}

- (NSNumber)customSaturation
{
  return self->_customSaturation;
}

- (void)setCustomSaturation:(id)a3
{
  objc_storeStrong((id *)&self->_customSaturation, a3);
}

- (UIColor)customColorTint
{
  return self->_customColorTint;
}

- (void)setCustomColorTint:(id)a3
{
  objc_storeStrong((id *)&self->_customColorTint, a3);
}

- (NSNumber)customColorTintAlpha
{
  return self->_customColorTintAlpha;
}

- (void)setCustomColorTintAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_customColorTintAlpha, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customColorTintAlpha, 0);
  objc_storeStrong((id *)&self->_customColorTint, 0);
  objc_storeStrong((id *)&self->_customSaturation, 0);
  objc_storeStrong((id *)&self->_customBlurRadius, 0);
}

@end
