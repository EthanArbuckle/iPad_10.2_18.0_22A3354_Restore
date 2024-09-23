@implementation LPShadowStyle

- (LPShadowStyle)init
{
  LPShadowStyle *v2;
  LPShadowStyle *v3;
  LPShadowStyle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPShadowStyle;
  v2 = -[LPShadowStyle init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)cardHeadingIconShadow
{
  LPShadowStyle *v2;
  _BOOL4 v3;
  double v4;
  void *v5;

  v2 = objc_alloc_init(LPShadowStyle);
  -[LPShadowStyle setRadius:](v2, "setRadius:", 7.0);
  v3 = +[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators");
  v4 = 0.07;
  if (v3)
    v4 = 1.0;
  -[LPShadowStyle setOpacity:](v2, "setOpacity:", v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPShadowStyle setColor:](v2, "setColor:", v5);

  return v2;
}

+ (id)collaborationPreviewShadow
{
  LPShadowStyle *v2;
  _BOOL4 v3;
  double v4;
  void *v5;
  LPSize *v6;

  v2 = objc_alloc_init(LPShadowStyle);
  -[LPShadowStyle setRadius:](v2, "setRadius:", 3.0);
  v3 = +[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators");
  v4 = 0.15;
  if (v3)
    v4 = 1.0;
  -[LPShadowStyle setOpacity:](v2, "setOpacity:", v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPShadowStyle setColor:](v2, "setColor:", v5);

  v6 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 0.0, 1.0);
  -[LPShadowStyle setOffset:](v2, "setOffset:", v6);

  return v2;
}

+ (id)wordmarkShadow
{
  LPShadowStyle *v2;
  LPSize *v3;

  v2 = objc_alloc_init(LPShadowStyle);
  -[LPShadowStyle setRadius:](v2, "setRadius:", 1.0);
  v3 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 1.0, 1.0);
  -[LPShadowStyle setOffset:](v2, "setOffset:", v3);

  return v2;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (LPSize)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
