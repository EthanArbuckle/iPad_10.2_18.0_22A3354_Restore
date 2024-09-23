@implementation GKViewController

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKViewController;
  -[GKViewController loadView](&v5, sel_loadView);
  -[GKViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

}

- (GKViewController)rootViewController
{
  if (self->_rootViewController)
    self = self->_rootViewController;
  return self;
}

- (GKColorPalette)colorPalette
{
  GKColorPalette *colorPalette;
  void *v4;

  colorPalette = self->_colorPalette;
  if (!colorPalette)
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViewController setColorPalette:](self, "setColorPalette:", v4);

    colorPalette = self->_colorPalette;
  }
  return colorPalette;
}

- (BOOL)displayUsingSplitNavigationBar
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKViewController;
  -[GKViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!-[GKViewController shouldUpdateContentOnlyWhenAuthenticated](self, "shouldUpdateContentOnlyWhenAuthenticated")
    || (objc_msgSend(MEMORY[0x1E0D25330], "localPlayer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isAuthenticated"),
        v4,
        v5))
  {
    -[GKViewController _gkSetContentsNeedUpdateWithHandler:](self, "_gkSetContentsNeedUpdateWithHandler:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKViewController;
  -[GKViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[GKViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popToRootViewControllerAnimated:", v3);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v6 = *MEMORY[0x1E0D25B68] == 0;
    else
      v6 = 0;
    v7 = !v6;
  }
  else
  {
    v7 = 0;
  }
  if (a3 == 1)
    return 1;
  else
    return v7 ^ (*MEMORY[0x1E0D253F8] != 0);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
}

- (BOOL)shouldUpdateContentOnlyWhenAuthenticated
{
  return self->_shouldUpdateContentOnlyWhenAuthenticated;
}

- (void)setShouldUpdateContentOnlyWhenAuthenticated:(BOOL)a3
{
  self->_shouldUpdateContentOnlyWhenAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
