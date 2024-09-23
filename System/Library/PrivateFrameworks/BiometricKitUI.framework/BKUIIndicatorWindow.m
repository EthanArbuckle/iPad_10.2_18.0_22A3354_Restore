@implementation BKUIIndicatorWindow

+ (id)instanceWithWindowScene:(id)a3
{
  id v3;
  BKUIIndicatorWindow *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(BKUIIndicatorWindow);
  -[BKUIIndicatorWindow setWindowLevel:](v4, "setWindowLevel:", *MEMORY[0x1E0CEBE20]);
  -[BKUIIndicatorWindow setWindowScene:](v4, "setWindowScene:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIIndicatorWindow setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[BKUIIndicatorWindow indicatorController](v4, "indicatorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIIndicatorWindow setRootViewController:](v4, "setRootViewController:", v6);

  -[BKUIIndicatorWindow makeKeyAndVisible](v4, "makeKeyAndVisible");
  -[BKUIIndicatorWindow setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  return v4;
}

- (BKUIIndicatorViewController)indicatorController
{
  BKUIIndicatorViewController *indicatorController;
  BKUIIndicatorViewController *v4;
  BKUIIndicatorViewController *v5;

  indicatorController = self->_indicatorController;
  if (!indicatorController)
  {
    v4 = objc_alloc_init(BKUIIndicatorViewController);
    v5 = self->_indicatorController;
    self->_indicatorController = v4;

    indicatorController = self->_indicatorController;
  }
  return indicatorController;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
}

- (void)setShouldShow:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[BKUIIndicatorWindow indicatorController](self, "indicatorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldShow:", v3);

  -[BKUIIndicatorWindow layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setIndicatorController:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorController, a3);
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorController, 0);
}

@end
