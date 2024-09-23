@implementation MKThemeMultiPartLabel

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKThemeMultiPartLabel;
  -[MKThemeMultiPartLabel willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  if (self->__mapkit_themeColorProvider)
    -[MKThemeMultiPartLabel infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)set_mapkit_themeColorProvider:(id)a3
{
  void *v4;
  id mapkit_themeColorProvider;

  v4 = (void *)objc_msgSend(a3, "copy");
  mapkit_themeColorProvider = self->__mapkit_themeColorProvider;
  self->__mapkit_themeColorProvider = v4;

  if (self->__mapkit_themeColorProvider)
    -[MKThemeMultiPartLabel infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)infoCardThemeChanged
{
  void (**mapkit_themeColorProvider)(id, void *);
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKThemeMultiPartLabel;
  -[UIView infoCardThemeChanged](&v6, sel_infoCardThemeChanged);
  mapkit_themeColorProvider = (void (**)(id, void *))self->__mapkit_themeColorProvider;
  if (mapkit_themeColorProvider)
  {
    -[UIView mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    mapkit_themeColorProvider[2](mapkit_themeColorProvider, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMultiPartLabel setTextColor:](self, "setTextColor:", v5);

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
