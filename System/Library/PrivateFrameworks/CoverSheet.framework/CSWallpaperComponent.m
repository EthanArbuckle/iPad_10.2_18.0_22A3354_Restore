@implementation CSWallpaperComponent

- (CSWallpaperComponent)init
{
  CSWallpaperComponent *v2;
  CSWallpaperComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSWallpaperComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSComponent setType:](v2, "setType:", 6);
  return v3;
}

- (id)shouldMatchBackgroundStyle:(BOOL)a3
{
  -[CSWallpaperComponent setShouldMatchBackgroundStyle:](self, "setShouldMatchBackgroundStyle:", a3);
  return self;
}

- (void)setShouldMatchBackgroundStyle:(BOOL)a3
{
  -[CSComponent setFlag:](self, "setFlag:", BSSettingFlagForBool());
}

- (BOOL)shouldMatchBackgroundStyle
{
  -[CSComponent flag](self, "flag");
  return BSSettingFlagIsExplicitNo() ^ 1;
}

@end
