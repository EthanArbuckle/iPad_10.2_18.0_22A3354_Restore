@implementation CAMFlashExpandableStatusIndicator

- (CAMFlashExpandableStatusIndicator)initWithFrame:(CGRect)a3
{
  CAMFlashExpandableStatusIndicator *v3;
  CAMFlashExpandableStatusIndicator *v4;
  void *v5;
  objc_super v7;
  uint64_t v8;

  v7.receiver = self;
  v7.super_class = (Class)CAMFlashExpandableStatusIndicator;
  v3 = -[CAMExpandingControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMFlashExpandableStatusIndicator setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("FlashExpandableStatusIndicator"));
    -[CAMFlashExpandableStatusIndicator _updateMenu](v4, "_updateMenu");
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v8, "Q");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl setSelectedState:animated:](v4, "setSelectedState:animated:", v5, 0);

  }
  return v4;
}

- (void)_updateMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  -[CAMFlashExpandableStatusIndicator _menuItemForFlashStatus:](self, "_menuItemForFlashStatus:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[CAMFlashExpandableStatusIndicator _menuItemForFlashStatus:](self, "_menuItemForFlashStatus:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  -[CAMFlashExpandableStatusIndicator _menuItemForFlashStatus:](self, "_menuItemForFlashStatus:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  -[CAMFlashExpandableStatusIndicator _menuItemForFlashStatus:](self, "_menuItemForFlashStatus:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl setMenu:](self, "setMenu:", v7);

}

- (id)_menuItemForFlashStatus:(unint64_t)a3
{
  CAMExpandingControlMenuItemConfiguration *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v16;

  v5 = objc_alloc_init(CAMExpandingControlMenuItemConfiguration);
  v6 = -[CAMFlashExpandableStatusIndicator isFlashActive](self, "isFlashActive");
  -[CAMExpandingControlMenuItemConfiguration setSlashesTitle:](v5, "setSlashesTitle:", -[CAMFlashExpandableStatusIndicator _shouldUseSlashForStatus:](self, "_shouldUseSlashForStatus:", a3));
  -[CAMExpandingControlMenuItemConfiguration setTintsTitle:](v5, "setTintsTitle:", -[CAMFlashExpandableStatusIndicator _shouldTintForStatus:flashActive:](self, "_shouldTintForStatus:flashActive:", a3, v6));
  -[CAMExpandingControlMenuItemConfiguration setTitleBorder:](v5, "setTitleBorder:", -[CAMFlashExpandableStatusIndicator _borderForStatus:flashActive:](self, "_borderForStatus:flashActive:", a3, v6));
  -[CAMExpandingControlMenuItemConfiguration setHidden:](v5, "setHidden:", -[CAMFlashExpandableStatusIndicator _shouldHideForStatus:](self, "_shouldHideForStatus:", a3));
  -[CAMFlashExpandableStatusIndicator _axHUDSymbolNameForFlashStatus:](self, "_axHUDSymbolNameForFlashStatus:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControlMenuItemConfiguration setAxHUDSymbolName:](v5, "setAxHUDSymbolName:", v7);

  -[CAMFlashExpandableStatusIndicator _symbolConfigurationForFlashStatus:](self, "_symbolConfigurationForFlashStatus:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControlMenuItemConfiguration setAxHUDSymbolConfiguration:](v5, "setAxHUDSymbolConfiguration:", v8);

  -[CAMFlashExpandableStatusIndicator _systemImageForFlashStatus:](self, "_systemImageForFlashStatus:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlashExpandableStatusIndicator _symbolConfigurationForFlashStatus:](self, "_symbolConfigurationForFlashStatus:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlashExpandableStatusIndicator _localizedTitleForStatus:](self, "_localizedTitleForStatus:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFlashExpandableStatusIndicator _localizedSubtitleForStatus:](self, "_localizedSubtitleForStatus:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v16, "Q");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMExpandingControlSystemImageMenuItem menuItemWithState:systemImageName:symbolConfiguration:subtitle:selectedSubtitle:configuration:](CAMExpandingControlSystemImageMenuItem, "menuItemWithState:systemImageName:symbolConfiguration:subtitle:selectedSubtitle:configuration:", v13, v9, v10, v11, v12, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)flashMode
{
  void *v2;
  int64_t v3;
  unint64_t v5;

  -[CAMExpandingControl selectedState](self, "selectedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  v5 = 1;
  objc_msgSend(v2, "getValue:size:", &v5, 8);
  if (v5 <= 3)
    v3 = qword_1DB9A6E68[v5];

  return v3;
}

- (void)setFlashMode:(int64_t)a3
{
  -[CAMFlashExpandableStatusIndicator setFlashMode:animated:](self, "setFlashMode:animated:", a3, 0);
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  if (!-[CAMFlashExpandableStatusIndicator isFlashUnavailable](self, "isFlashUnavailable"))
  {
    v7 = a3 != 0;
    if (a3 == 2)
      v7 = 2;
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v9, "Q");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl setSelectedState:animated:](self, "setSelectedState:animated:", v8, v4);

  }
}

- (void)setFlashActive:(BOOL)a3
{
  if (self->_flashActive != a3)
  {
    self->_flashActive = a3;
    -[CAMFlashExpandableStatusIndicator _updateMenu](self, "_updateMenu");
  }
}

- (BOOL)isFlashUnavailable
{
  void *v2;
  BOOL v3;
  uint64_t v5;

  -[CAMExpandingControl selectedState](self, "selectedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  objc_msgSend(v2, "getValue:size:", &v5, 8);
  v3 = v5 == 3;

  return v3;
}

- (void)setFlashUnavailable:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if (-[CAMFlashExpandableStatusIndicator isFlashUnavailable](self, "isFlashUnavailable") != a3)
  {
    v5 = 3;
    if (!v3)
      v5 = 0;
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v7, "Q");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControl setSelectedState:animated:](self, "setSelectedState:animated:", v6, 0);
    if (v3)
      -[CAMExpandingControl setExpanded:](self, "setExpanded:", 0);

  }
}

- (id)_localizedTitleForStatus:(unint64_t)a3
{
  if (a3 <= 3)
  {
    CAMLocalizedFrameworkString(off_1EA32C598[a3], 0);
    self = (CAMFlashExpandableStatusIndicator *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_localizedSubtitleForStatus:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  CAMLocalizedFrameworkString(off_1EA32C5B8[a3], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldUseSlashForStatus:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldHideForStatus:(unint64_t)a3
{
  return a3 == 3;
}

- (int64_t)_borderForStatus:(unint64_t)a3 flashActive:(BOOL)a4
{
  switch(a3)
  {
    case 3uLL:
      return 1;
    case 2uLL:
      if (a4)
        return 2;
      else
        return 1;
    case 0uLL:
      return 1;
    default:
      return 2;
  }
}

- (BOOL)_shouldTintForStatus:(unint64_t)a3 flashActive:(BOOL)a4
{
  switch(a3)
  {
    case 3uLL:
      return 0;
    case 2uLL:
      return a4;
    case 0uLL:
      return 0;
  }
  return 1;
}

- (id)_symbolConfigurationForFlashStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
    return 0;
  v3 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithPaletteColors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_systemImageForFlashStatus:(unint64_t)a3
{
  if (a3 == 3)
    return CFSTR("bolt.trianglebadge.exclamationmark.fill");
  else
    return CFSTR("bolt.fill");
}

- (id)_axHUDSymbolNameForFlashStatus:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("bolt.slash.fill");
  else
    return off_1EA32C5D0[a3 - 1];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMFlashExpandableStatusIndicator;
  -[CAMExpandingControl setOrientation:animated:](&v4, sel_setOrientation_animated_, a3, a4);
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarFlashButton");
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

@end
