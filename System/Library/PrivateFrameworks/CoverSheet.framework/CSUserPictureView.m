@implementation CSUserPictureView

- (CSUserPictureView)initWithFrame:(CGRect)a3
{
  CSUserPictureView *v3;
  CSUserPictureView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSUserPictureView;
  v3 = -[CSUserPictureView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_diameter = 256.0;
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSUserPictureView setLegibilitySettings:](v4, "setLegibilitySettings:", v5);

  }
  return v4;
}

- (void)setContact:(id)a3
{
  CNContact *v4;
  CNContact *contact;

  v4 = (CNContact *)objc_msgSend(a3, "copy");
  contact = self->_contact;
  self->_contact = v4;

  -[CSUserPictureView _regenerateImage](self, "_regenerateImage");
}

- (void)layoutSubviews
{
  CGRect v3;
  CGRect v4;

  -[CSUserPictureView bounds](self, "bounds");
  -[_UILegibilityView sizeThatFits:](self->_monogramLegibilityView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  UIRectCenteredIntegralRectScale();
  v4 = CGRectOffset(v3, 0.0, -20.0);
  -[_UILegibilityView setFrame:](self->_monogramLegibilityView, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height, 0);
  -[_UILegibilityView setIsAccessibilityElement:](self->_monogramLegibilityView, "setIsAccessibilityElement:", 1);
  -[_UILegibilityView setAccessibilityIdentifier:](self->_monogramLegibilityView, "setAccessibilityIdentifier:", CFSTR("user-picture-icon"));
}

- (id)presentationRegions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:", self->_monogramLegibilityView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "role:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  void *v6;
  double v7;
  id v8;

  p_legibilitySettings = &self->_legibilitySettings;
  v8 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userPictureStrengthForStyle:", -[_UILegibilitySettings style](*p_legibilitySettings, "style"));
    self->_legibilityStrength = v7;

    -[CSUserPictureView _regenerateImage](self, "_regenerateImage");
  }

}

+ (id)_monogrammerForLegibilitySettings:(id)a3 diameter:(double)a4
{
  uint64_t v5;

  if ((unint64_t)objc_msgSend(a3, "style") >= 2)
    v5 = 2;
  else
    v5 = 3;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", v5, a4);
}

- (void)_regenerateImage
{
  void *v3;
  void *v4;
  _UILegibilityView *monogramLegibilityView;
  _UILegibilityView *v6;
  _UILegibilityView *v7;
  void *v8;
  id v9;

  if (self->_contact)
  {
    v3 = (void *)objc_opt_class();
    -[CSUserPictureView legibilitySettings](self, "legibilitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_monogrammerForLegibilitySettings:diameter:", v4, self->_diameter);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    monogramLegibilityView = self->_monogramLegibilityView;
    if (!monogramLegibilityView)
    {
      v6 = (_UILegibilityView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADF8]), "initWithSettings:strength:image:", self->_legibilitySettings, 0, self->_legibilityStrength);
      v7 = self->_monogramLegibilityView;
      self->_monogramLegibilityView = v6;

      -[CSUserPictureView addSubview:](self, "addSubview:", self->_monogramLegibilityView);
      monogramLegibilityView = self->_monogramLegibilityView;
    }
    objc_msgSend(v9, "monogramForContact:", self->_contact);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILegibilityView setImage:shadowImage:](monogramLegibilityView, "setImage:shadowImage:", v8, 0);

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_legibilityStrength;
}

- (void)setStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_monogramLegibilityView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
