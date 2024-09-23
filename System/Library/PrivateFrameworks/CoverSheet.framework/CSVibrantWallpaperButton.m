@implementation CSVibrantWallpaperButton

- (CSVibrantWallpaperButton)initWithFrame:(CGRect)a3
{
  CSVibrantWallpaperButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSVibrantWallpaperButton;
  v3 = -[SBUIVibrantButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
    -[SBUIVibrantButton setVibrancyAllowed:](v3, "setVibrancyAllowed:", +[CSVibrancyUtility supportsVibrancy](CSVibrancyUtility, "supportsVibrancy"));
  return v3;
}

- (void)setWallpaperProvider:(id)a3
{
  id WeakRetained;
  CSWallpaperView *v5;
  CSWallpaperView *effectView;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperProvider, obj);
    objc_msgSend(obj, "createCoverSheetWallpaperViewWithTransformOptions:", 0);
    v5 = (CSWallpaperView *)objc_claimAutoreleasedReturnValue();
    effectView = self->_effectView;
    self->_effectView = v5;

    -[CSWallpaperView setCoverSheetWallpaperStyle:](self->_effectView, "setCoverSheetWallpaperStyle:", 1);
    -[CSWallpaperView setFullscreen:](self->_effectView, "setFullscreen:", 0);
    -[CSVibrantWallpaperButton _updateVibrancy](self, "_updateVibrancy");
  }

}

- (void)setLegibilitySettings:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSVibrantWallpaperButton;
  -[SBUIVibrantButton setLegibilitySettings:](&v4, sel_setLegibilitySettings_, a3);
  -[CSVibrantWallpaperButton _updateVibrancy](self, "_updateVibrancy");
}

- (void)_updateVibrancy
{
  CSWallpaperView *effectView;
  id WeakRetained;

  if (+[CSVibrancyUtility supportsVibrancy](CSVibrancyUtility, "supportsVibrancy"))
  {
    effectView = self->_effectView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
    +[CSVibrancyUtility updateVibrantView:backgroundView:colorProvider:](CSVibrancyUtility, "updateVibrantView:backgroundView:colorProvider:", self, effectView, WeakRetained);

  }
}

- (CSWallpaperView)effectView
{
  return self->_effectView;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return (CSWallpaperColorProvider *)objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
}

- (void)setWallpaperColorProvider:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperColorProvider, a3);
}

- (CSWallpaperProviding)wallpaperProvider
{
  return (CSWallpaperProviding *)objc_loadWeakRetained((id *)&self->_wallpaperProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperProvider);
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
