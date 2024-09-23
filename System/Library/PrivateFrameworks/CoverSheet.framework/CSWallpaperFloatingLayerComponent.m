@implementation CSWallpaperFloatingLayerComponent

- (CSWallpaperFloatingLayerComponent)init
{
  CSWallpaperFloatingLayerComponent *v2;
  CSWallpaperFloatingLayerComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSWallpaperFloatingLayerComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSComponent setType:](v2, "setType:", 23);
  return v3;
}

- (id)shouldRenderInline:(BOOL)a3
{
  -[CSWallpaperFloatingLayerComponent setShouldRenderInline:](self, "setShouldRenderInline:", a3);
  return self;
}

- (id)shouldMatchMove:(BOOL)a3
{
  -[CSWallpaperFloatingLayerComponent setShouldMatchMove:](self, "setShouldMatchMove:", a3);
  return self;
}

- (id)shouldRenderForPosterSwitcher:(BOOL)a3
{
  -[CSWallpaperFloatingLayerComponent setShouldRenderForPosterSwitcher:](self, "setShouldRenderForPosterSwitcher:", a3);
  return self;
}

- (void)setShouldRenderInline:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSComponent setValue:](self, "setValue:", v4);

}

- (BOOL)shouldRenderInline
{
  void *v2;
  char v3;

  -[CSComponent value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShouldMatchMove:(BOOL)a3
{
  -[CSComponent setFlag:](self, "setFlag:", BSSettingFlagForBool());
}

- (BOOL)shouldMatchMove
{
  -[CSComponent flag](self, "flag");
  return BSSettingFlagIsExplicitNo() ^ 1;
}

@end
