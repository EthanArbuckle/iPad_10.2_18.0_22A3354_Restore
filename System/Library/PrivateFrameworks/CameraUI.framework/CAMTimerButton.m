@implementation CAMTimerButton

- (CAMTimerButton)initWithLayoutStyle:(int64_t)a3
{
  CAMTimerButton *v3;
  CAMTimerButton *v4;
  CAMTimerButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTimerButton;
  v3 = -[CAMExpandableMenuButton initWithLayoutStyle:](&v7, sel_initWithLayoutStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMTimerButton _commonCAMTimerButtonInitialization](v3, "_commonCAMTimerButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (id)shownIndexesWhileCollapsed
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (!-[CAMTimerButton hideOffWhenCollapsed](self, "hideOffWhenCollapsed"))
    objc_msgSend(v3, "addIndex:", 0);
  objc_msgSend(v3, "addIndex:", 1);
  objc_msgSend(v3, "addIndex:", 2);
  objc_msgSend(v3, "addIndex:", 3);
  return v3;
}

- (BOOL)hideOffWhenCollapsed
{
  return self->_hideOffWhenCollapsed;
}

- (void)_commonCAMTimerButtonInitialization
{
  UIImageView *v3;
  UIImageView *glyphView;
  id v5;

  -[CAMTimerButton _currentGlyphImageForAccessibiliyHUD:](self, "_currentGlyphImageForAccessibiliyHUD:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  -[CAMTimerButton setDuration:](self, "setDuration:", 0);
  -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", 1, 1);
  -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", 1, 2);
  -[CAMExpandableMenuButton setHighlighted:forIndex:](self, "setHighlighted:forIndex:", 1, 3);

}

- (id)_currentGlyphImageForAccessibiliyHUD:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle");
  if (v4 > 4)
  {
    v5 = 0;
    if (!v3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = off_1EA32BDE8[v4];
  if (v3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-AXHUD"), v5);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setDuration:(int64_t)a3
{
  -[CAMTimerButton setDuration:animated:](self, "setDuration:animated:", a3, 0);
}

- (void)setDuration:(int64_t)a3 animated:(BOOL)a4
{
  if (-[CAMExpandableMenuButton selectedIndex](self, "selectedIndex", a3, a4) != a3)
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHideOffWhenCollapsed:(BOOL)a3
{
  -[CAMTimerButton setHideOffWhenCollapsed:needsReloadData:](self, "setHideOffWhenCollapsed:needsReloadData:", a3, 1);
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMTimerButton;
  -[CAMExpandableMenuButton reloadData](&v3, sel_reloadData);
  -[CAMTimerButton _updateCurrentGlyphImage](self, "_updateCurrentGlyphImage");
}

- (int64_t)numberOfMenuItems
{
  return 4;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  id WeakRetained;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timeIntervalForDuration:", a3);
    v6 = v5;

    CAMTimerDurationFormatter();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    CAMLocalizedFrameworkString(CFSTR("TIMER_DURATION_TEXT"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CAMLocalizedFrameworkString(CFSTR("TIMER_OFF_TEXT"), CFSTR("A label indicating the camera's timer is turned off."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  void *v3;
  id v4;

  -[CAMTimerButton _currentGlyphImageForAccessibiliyHUD:](self, "_currentGlyphImageForAccessibiliyHUD:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMTimerButton _glyphView](self, "_glyphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

}

- (CAMTimerButton)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMTimerButton initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)setHideOffWhenCollapsed:(BOOL)a3 needsReloadData:(BOOL)a4
{
  if (self->_hideOffWhenCollapsed != a3)
  {
    self->_hideOffWhenCollapsed = a3;
    if (a4)
      -[CAMTimerButton reloadData](self, "reloadData");
  }
}

- (double)padHeaderViewContentInsetLeft
{
  return 10.0;
}

- (id)imageForAccessibilityHUD
{
  return -[CAMTimerButton _currentGlyphImageForAccessibiliyHUD:](self, "_currentGlyphImageForAccessibiliyHUD:", 1);
}

- (CAMTimerButtonDelegate)delegate
{
  return (CAMTimerButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__glyphView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
