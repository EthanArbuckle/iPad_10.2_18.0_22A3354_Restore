@implementation SFShadowView

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  return CGRectInset(a3, -self->_shadowRadius, -self->_shadowRadius);
}

- (SFShadowView)initWithFrame:(CGRect)a3
{
  SFShadowView *v3;
  id v4;
  double v5;
  BOOL v6;
  double v7;
  void *v8;
  id v9;
  SFShadowView *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SFShadowView;
  v3 = -[SFShadowView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (shadowImage_onceToken_0 != -1)
      dispatch_once(&shadowImage_onceToken_0, &__block_literal_global_24);
    v4 = (id)shadowImage_image_0;
    objc_msgSend(v4, "scale");
    v6 = v5 == 2.0;
    v7 = 60.0;
    if (v6)
      v7 = 40.0;
    v3->_shadowRadius = v7;
    -[SFShadowView setImage:](v3, "setImage:", v4);
    v3->_vibrancyEnabled = 1;
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[SFShadowView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v8, v3, sel_updateAppearance);

    -[SFShadowView updateAppearance](v3, "updateAppearance");
    v10 = v3;

  }
  return v3;
}

- (void)updateAppearance
{
  void *v2;
  _BOOL4 vibrancyEnabled;
  __int128 *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  vibrancyEnabled = self->_vibrancyEnabled;
  if (self->_vibrancyEnabled)
  {
    -[SFShadowView traitCollection](self, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceStyle") == 2)
      v5 = &darkColorMatrix;
    else
      v5 = &lightColorMatrix;
    v7 = v5[3];
    v15 = v5[2];
    v16 = v7;
    v17 = v5[4];
    v8 = v5[1];
    v13 = *v5;
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v15;
    v12[3] = v16;
    v12[4] = v17;
    v12[0] = v13;
    v12[1] = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "{CAColorMatrix=ffffffffffffffffffff}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, *MEMORY[0x1E0CD2D20]);

    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[SFShadowView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilters:", v6);

  if (vibrancyEnabled)
  {

  }
}

- (void)setVibrancyEnabled:(BOOL)a3
{
  if (self->_vibrancyEnabled != a3)
  {
    self->_vibrancyEnabled = a3;
    -[SFShadowView updateAppearance](self, "updateAppearance");
  }
}

- (BOOL)isVibrancyEnabled
{
  return self->_vibrancyEnabled;
}

@end
