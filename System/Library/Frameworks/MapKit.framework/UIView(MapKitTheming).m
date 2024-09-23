@implementation UIView(MapKitTheming)

- (id)mk_theme
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3)
  {
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 1)
      v5 = 1;
    else
      v5 = 2;

    +[MKInfoCardThemeManager setTheme:](MKInfoCardThemeManager, "setTheme:", v5);
  }
  return +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
}

@end
