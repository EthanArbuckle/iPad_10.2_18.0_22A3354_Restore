@implementation HUQuickControlColorViewProfile

- (HUQuickControlColorViewProfile)init
{
  HUQuickControlColorViewProfile *v2;
  HUQuickControlColorViewProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlColorViewProfile;
  v2 = -[HUQuickControlColorViewProfile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUQuickControlColorViewProfile setSupportsRGBColor:](v2, "setSupportsRGBColor:", 1);
    -[HUQuickControlColorViewProfile setSupportsNaturalLighting:](v3, "setSupportsNaturalLighting:", 0);
    -[HUQuickControlColorViewProfile setNaturalLightingEnabled:](v3, "setNaturalLightingEnabled:", 0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlColorViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSupportsRGBColor:", -[HUQuickControlColorViewProfile supportsRGBColor](self, "supportsRGBColor"));
  objc_msgSend(v4, "setSupportsNaturalLighting:", -[HUQuickControlColorViewProfile supportsNaturalLighting](self, "supportsNaturalLighting"));
  objc_msgSend(v4, "setNaturalLightingEnabled:", -[HUQuickControlColorViewProfile naturalLightingEnabled](self, "naturalLightingEnabled"));
  -[HUQuickControlColorViewProfile colorProfile](self, "colorProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorProfile:", v5);

  objc_msgSend(v4, "setMode:", -[HUQuickControlColorViewProfile mode](self, "mode"));
  return v4;
}

- (BOOL)supportsRGBColor
{
  return self->_supportsRGBColor;
}

- (void)setSupportsRGBColor:(BOOL)a3
{
  self->_supportsRGBColor = a3;
}

- (BOOL)supportsNaturalLighting
{
  return self->_supportsNaturalLighting;
}

- (void)setSupportsNaturalLighting:(BOOL)a3
{
  self->_supportsNaturalLighting = a3;
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  self->_naturalLightingEnabled = a3;
}

- (HFColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (void)setColorProfile:(id)a3
{
  objc_storeStrong((id *)&self->_colorProfile, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorProfile, 0);
}

@end
