@implementation CAMHDRButton

- (CAMHDRButton)initWithLayoutStyle:(int64_t)a3
{
  CAMHDRButton *v3;
  CAMHDRButton *v4;
  CAMHDRButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMHDRButton;
  v3 = -[CAMExpandableMenuButton initWithLayoutStyle:](&v7, sel_initWithLayoutStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMHDRButton _commonCAMHDRButtonInitialization](v3, "_commonCAMHDRButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMHDRButtonInitialization
{
  UIImageView *v3;
  UIImageView *glyphView;
  id v5;

  self->_allowsHDROn = 1;
  -[CAMHDRButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  -[UIImageView _setAnimatesContents:](self->__glyphView, "_setAnimatesContents:", 1);
  -[CAMHDRButton _updateAllowedModes](self, "_updateAllowedModes");

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
  v5 = -[CAMHDRButton HDRMode](self, "HDRMode");
  v6 = -[CAMExpandableMenuButton isExpanded](self, "isExpanded");
  v7 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
  v8 = -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle");
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 2:
    case 4:
      v10 = CFSTR("CAMHDRButton");
      v11 = CFSTR("CAMHDRButtonOff");
      goto LABEL_4;
    case 1:
      v10 = CFSTR("CAMHDRButtonPad");
      v11 = CFSTR("CAMHDRButtonOffPad");
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

- (int64_t)HDRMode
{
  return -[CAMHDRButton modeForIndex:](self, "modeForIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
}

- (int64_t)modeForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[CAMHDRButton _allowedModes](self, "_allowedModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0 || objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  return v7;
}

- (NSArray)_allowedModes
{
  return self->__allowedModes;
}

- (void)_updateAllowedModes
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[CAMHDRButton allowsAutomaticHDR](self, "allowsAutomaticHDR"))
    objc_msgSend(v3, "addObject:", &unk_1EA3B0F28);
  if (-[CAMHDRButton allowsHDROn](self, "allowsHDROn"))
    objc_msgSend(v3, "addObject:", &unk_1EA3B0F40);
  objc_msgSend(v3, "addObject:", &unk_1EA3B0F58);
  -[CAMHDRButton _setAllowedModes:](self, "_setAllowedModes:", v3);

}

- (BOOL)allowsAutomaticHDR
{
  return self->_allowsAutomaticHDR;
}

- (BOOL)allowsHDROn
{
  return self->_allowsHDROn;
}

- (void)_setAllowedModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setAllowsAutomaticHDR:(BOOL)a3
{
  -[CAMHDRButton setAllowsAutomaticHDR:needsReloadData:](self, "setAllowsAutomaticHDR:needsReloadData:", a3, 1);
}

- (void)reloadData
{
  int64_t v3;
  int64_t v4;
  _BOOL4 v5;
  _BOOL8 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMHDRButton;
  -[CAMExpandableMenuButton reloadData](&v7, sel_reloadData);
  -[CAMHDRButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
  if (-[CAMHDRButton numberOfMenuItems](self, "numberOfMenuItems") >= 1)
  {
    v3 = 0;
    do
    {
      v4 = -[CAMHDRButton modeForIndex:](self, "modeForIndex:", v3);
      v5 = -[CAMHDRButton allowsAutomaticHDR](self, "allowsAutomaticHDR");
      v6 = v4 == 1 && v5;
      -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", v6, v3++);
    }
    while (v3 < -[CAMHDRButton numberOfMenuItems](self, "numberOfMenuItems"));
  }
}

- (int64_t)numberOfMenuItems
{
  void *v2;
  int64_t v3;

  -[CAMHDRButton _allowedModes](self, "_allowedModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = -[CAMHDRButton modeForIndex:](self, "modeForIndex:", a3);
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

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  void *v3;
  id v4;

  -[CAMHDRButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMHDRButton _glyphView](self, "_glyphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

}

- (void)setHDRMode:(int64_t)a3
{
  unint64_t v4;

  v4 = -[CAMHDRButton indexForMode:](self, "indexForMode:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = -[CAMHDRButton indexForMode:](self, "indexForMode:", 0);
  -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v4);
  -[CAMHDRButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
}

- (unint64_t)indexForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[CAMHDRButton _allowedModes](self, "_allowedModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setAllowsHDROn:(BOOL)a3
{
  int64_t v5;

  if (self->_allowsHDROn != a3)
  {
    v5 = -[CAMHDRButton HDRMode](self, "HDRMode");
    self->_allowsHDROn = a3;
    -[CAMHDRButton _updateFromAllowedModesChangeWithCurrentMode:needsReloadData:](self, "_updateFromAllowedModesChangeWithCurrentMode:needsReloadData:", v5, 1);
  }
}

- (CAMHDRButton)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMHDRButton initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)setAllowsAutomaticHDR:(BOOL)a3 needsReloadData:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;

  if (self->_allowsAutomaticHDR != a3)
  {
    v4 = a4;
    v7 = -[CAMHDRButton HDRMode](self, "HDRMode");
    self->_allowsAutomaticHDR = a3;
    -[CAMHDRButton _updateFromAllowedModesChangeWithCurrentMode:needsReloadData:](self, "_updateFromAllowedModesChangeWithCurrentMode:needsReloadData:", v7, v4);
  }
}

- (void)_updateFromAllowedModesChangeWithCurrentMode:(int64_t)a3 needsReloadData:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[CAMHDRButton _updateAllowedModes](self, "_updateAllowedModes");
  if (v4)
    -[CAMHDRButton reloadData](self, "reloadData");
  -[CAMHDRButton setHDRMode:](self, "setHDRMode:", a3);
}

- (double)padHeaderViewContentInsetLeft
{
  return 7.0;
}

- (BOOL)shouldAllowExpansion
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMHDRButton;
  v3 = -[CAMExpandableMenuButton shouldAllowExpansion](&v5, sel_shouldAllowExpansion);
  return !-[CAMHDRButton allowsHDROn](self, "allowsHDROn") | v3;
}

- (id)imageForAccessibilityHUD
{
  return -[CAMHDRButton _currentGlyphImageForAccessibilityHUD:](self, "_currentGlyphImageForAccessibilityHUD:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allowedModes, 0);
  objc_storeStrong((id *)&self->__glyphView, 0);
}

@end
