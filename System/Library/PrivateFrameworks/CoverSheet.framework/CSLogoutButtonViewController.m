@implementation CSLogoutButtonViewController

- (void)setWallpaperViewProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperProvider, obj);
    -[CSLogoutButtonViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWallpaperProvider:", obj);

  }
}

- (void)setWallpaperColorProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperColorProvider, obj);
    -[CSLogoutButtonViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWallpaperColorProvider:", obj);

  }
}

- (void)loadView
{
  CSVibrantWallpaperButton *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CSVibrantWallpaperButton *v9;

  v3 = [CSVibrantWallpaperButton alloc];
  v9 = -[CSVibrantWallpaperButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
  -[CSVibrantWallpaperButton setWallpaperColorProvider:](v9, "setWallpaperColorProvider:", WeakRetained);

  v5 = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
  -[CSVibrantWallpaperButton setWallpaperProvider:](v9, "setWallpaperProvider:", v5);

  -[CSLogoutButtonViewController setView:](self, "setView:", v9);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOGOUT_BUTTON_TITLE"), &stru_1E8E30B28, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIVibrantButton setTitle:](v9, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("SignOut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIVibrantButton setGlyphImage:](v9, "setGlyphImage:", v8);

  -[CSVibrantWallpaperButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
}

- (void)_buttonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);
  objc_msgSend(WeakRetained, "logout");

}

- (CSUserSessionControlling)userSessionController
{
  return (CSUserSessionControlling *)objc_loadWeakRetained((id *)&self->_userSessionController);
}

- (void)setUserSessionController:(id)a3
{
  objc_storeWeak((id *)&self->_userSessionController, a3);
}

- (CSWallpaperProviding)wallpaperProvider
{
  return (CSWallpaperProviding *)objc_loadWeakRetained((id *)&self->_wallpaperProvider);
}

- (void)setWallpaperProvider:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperProvider, a3);
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return (CSWallpaperColorProvider *)objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_destroyWeak((id *)&self->_wallpaperProvider);
  objc_destroyWeak((id *)&self->_userSessionController);
}

@end
