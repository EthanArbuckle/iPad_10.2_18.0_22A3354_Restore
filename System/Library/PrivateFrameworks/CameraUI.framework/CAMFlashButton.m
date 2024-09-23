@implementation CAMFlashButton

- (CAMFlashButton)initWithLayoutStyle:(int64_t)a3
{
  CAMFlashButton *v3;
  CAMFlashButton *v4;
  CAMFlashButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFlashButton;
  v3 = -[CAMExpandableMenuButton initWithLayoutStyle:](&v7, sel_initWithLayoutStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMFlashButton _commonCAMFlashButtonInitialization](v3, "_commonCAMFlashButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (BOOL)wantsSelectedItemToBeVisible
{
  objc_super v4;

  if (-[CAMFlashButton isUnavailable](self, "isUnavailable"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CAMFlashButton;
  return -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](&v4, sel_wantsSelectedItemToBeVisible);
}

- (BOOL)isUnavailable
{
  return self->_unavailable;
}

- (void)_commonCAMFlashButtonInitialization
{
  UIImageView *v3;
  UIImageView *glyphView;
  id v5;

  -[CAMFlashButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  -[UIImageView _setAnimatesContents:](self->__glyphView, "_setAnimatesContents:", 1);
}

- (id)_currentGlyphImageForAccessibilityHUD:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int v6;
  _BOOL4 v7;
  int64_t v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v5 = -[CAMFlashButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
  v6 = -[CAMExpandableMenuButton isExpanded](self, "isExpanded");
  v7 = -[CAMFlashButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
  v8 = -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle");
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 2:
    case 4:
      v10 = CFSTR("CAMFlashButton");
      v11 = CFSTR("CAMFlashButtonOff");
      goto LABEL_4;
    case 1:
      v10 = CFSTR("CAMFlashButtonPad");
      v11 = CFSTR("CAMFlashButtonOffPad");
LABEL_4:
      if (((v5 == 0) & ~v6 & !v7) != 0)
        v12 = (__CFString *)v11;
      else
        v12 = (__CFString *)v10;
      v9 = v12;
      break;
    default:
      break;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AXHUD"), v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v13;
  }
  if (v9)
  {
    v14 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamed:inBundle:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithRenderingMode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)modeForIndex:(int64_t)a3
{
  int64_t result;
  int64_t v5;

  LODWORD(result) = -[CAMFlashButton allowsAutomaticFlash](self, "allowsAutomaticFlash");
  v5 = 1;
  if ((_DWORD)result)
    v5 = 2;
  if (a3 == 2)
    v5 = 0;
  if (a3 == 1)
    return result;
  else
    return v5;
}

- (BOOL)allowsAutomaticFlash
{
  return self->_allowsAutomaticFlash;
}

- (void)setAllowsAutomaticFlash:(BOOL)a3
{
  -[CAMFlashButton setAllowsAutomaticFlash:needsReloadData:](self, "setAllowsAutomaticFlash:needsReloadData:", a3, 1);
}

- (int64_t)indexForMode:(int64_t)a3
{
  int64_t v4;
  BOOL v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;

  if (a3)
    v4 = a3 == 1;
  else
    v4 = 2;
  v5 = -[CAMFlashButton allowsAutomaticFlash](self, "allowsAutomaticFlash");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 <= 1)
    v7 = 1;
  else
    v7 = v4;
  v8 = v7 - 1;
  if (a3 != 2)
    v6 = v8;
  if (v5)
    return v4;
  else
    return v6;
}

- (void)reloadData
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMFlashButton;
  -[CAMExpandableMenuButton reloadData](&v4, sel_reloadData);
  -[CAMFlashButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
  if (-[CAMFlashButton numberOfMenuItems](self, "numberOfMenuItems") >= 1)
  {
    v3 = 0;
    do
    {
      -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", -[CAMFlashButton modeForIndex:](self, "modeForIndex:", v3) == 1, v3);
      ++v3;
    }
    while (v3 < -[CAMFlashButton numberOfMenuItems](self, "numberOfMenuItems"));
  }
}

- (int64_t)numberOfMenuItems
{
  if (-[CAMFlashButton isUnavailable](self, "isUnavailable"))
    return 0;
  if (-[CAMFlashButton allowsAutomaticFlash](self, "allowsAutomaticFlash"))
    return 3;
  return 2;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = -[CAMFlashButton modeForIndex:](self, "modeForIndex:", a3);
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = CFSTR("HDR_ON");
      v5 = CFSTR("A label for turning HDR mode on.");
    }
    else
    {
      if (v3 != 2)
      {
        v6 = 0;
        return v6;
      }
      v4 = CFSTR("HDR_AUTO");
      v5 = CFSTR("A label for selecting an automatic HDR mode.");
    }
  }
  else
  {
    v4 = CFSTR("HDR_OFF");
    v5 = CFSTR("A label for turning HDR mode off.");
  }
  CAMLocalizedFrameworkString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)headerView
{
  if (-[CAMFlashButton isUnavailable](self, "isUnavailable"))
    -[CAMFlashButton _warningIndicatorView](self, "_warningIndicatorView");
  else
    -[CAMFlashButton _glyphView](self, "_glyphView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  void *v3;
  id v4;

  -[CAMFlashButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFlashButton _glyphView](self, "_glyphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

}

- (void)setFlashMode:(int64_t)a3
{
  -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", -[CAMFlashButton indexForMode:](self, "indexForMode:", a3));
  -[CAMFlashButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
}

- (void)setUnavailable:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *warningIndicatorView;
  UIImageView *v10;
  void *v11;

  if (self->_unavailable != a3)
  {
    self->_unavailable = a3;
    if (a3 && !self->__warningIndicatorView)
    {
      v4 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMFlashDisabled_2only_"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithRenderingMode:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
      warningIndicatorView = self->__warningIndicatorView;
      self->__warningIndicatorView = v8;

      v10 = self->__warningIndicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v10, "setTintColor:", v11);

    }
    -[CAMFlashButton reloadData](self, "reloadData");
  }
}

- (CAMFlashButton)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMFlashButton initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (int64_t)flashMode
{
  return -[CAMFlashButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
}

- (void)setAllowsAutomaticFlash:(BOOL)a3 needsReloadData:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;

  if (self->_allowsAutomaticFlash != a3)
  {
    v4 = a4;
    v7 = -[CAMFlashButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
    self->_allowsAutomaticFlash = a3;
    v8 = -[CAMFlashButton indexForMode:](self, "indexForMode:", v7);
    if (v4)
      -[CAMFlashButton reloadData](self, "reloadData");
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v8);
    -[CAMFlashButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
  }
}

- (double)padHeaderViewContentInsetLeft
{
  return 14.0;
}

- (BOOL)shouldIgnoreMenuInteraction
{
  if (-[CAMFlashButton isUnavailable](self, "isUnavailable"))
    -[CAMFlashButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
  return -[CAMFlashButton isUnavailable](self, "isUnavailable");
}

- (double)collapsedSelectedLabelHorizontalMargin
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFlashButton;
  -[CAMExpandableMenuButton collapsedSelectedLabelHorizontalMargin](&v6, sel_collapsedSelectedLabelHorizontalMargin);
  v4 = v3;
  if (-[CAMFlashButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible"))
  {
    v4 = v4 + -5.0;
    if (v4 < 0.0)
      return 0.0;
  }
  return v4;
}

- (id)imageForAccessibilityHUD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CAMFlashButton isUnavailable](self, "isUnavailable"))
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("CAMFlashDisabled-AXHUD"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CAMFlashButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (UIImageView)_warningIndicatorView
{
  return self->__warningIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__warningIndicatorView, 0);
  objc_storeStrong((id *)&self->__glyphView, 0);
}

@end
