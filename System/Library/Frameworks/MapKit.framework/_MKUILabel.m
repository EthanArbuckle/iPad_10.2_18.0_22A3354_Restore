@implementation _MKUILabel

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKUILabel;
  -[_MKUILabel didMoveToWindow](&v3, sel_didMoveToWindow);
  if (self->__mapkit_themeColorProvider)
    -[_MKUILabel infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)set_mapkit_themeColorProvider:(id)a3
{
  void *v4;
  id mapkit_themeColorProvider;

  v4 = (void *)objc_msgSend(a3, "copy");
  mapkit_themeColorProvider = self->__mapkit_themeColorProvider;
  self->__mapkit_themeColorProvider = v4;

  if (self->__mapkit_themeColorProvider)
    -[_MKUILabel infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)infoCardThemeChanged
{
  void (**mapkit_themeColorProvider)(id, void *);
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKUILabel;
  -[UIView infoCardThemeChanged](&v6, sel_infoCardThemeChanged);
  mapkit_themeColorProvider = (void (**)(id, void *))self->__mapkit_themeColorProvider;
  if (mapkit_themeColorProvider)
  {
    -[UIView mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    mapkit_themeColorProvider[2](mapkit_themeColorProvider, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setTextColor:](self, "setTextColor:", v5);

  }
}

- (id)_mapkit_themeColorProvider
{
  return self->__mapkit_themeColorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__mapkit_themeColorProvider, 0);
}

@end
