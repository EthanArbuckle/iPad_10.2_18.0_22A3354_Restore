@implementation SFLockdownStatusBar

- (SFLockdownStatusBar)initWithFrame:(CGRect)a3
{
  SFLockdownStatusBar *v3;
  UILabel *v4;
  UILabel *lockdownModeStatusLabel;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SFLockdownStatusBar *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFLockdownStatusBar;
  v3 = -[SFLockdownStatusBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    lockdownModeStatusLabel = v3->_lockdownModeStatusLabel;
    v3->_lockdownModeStatusLabel = v4;

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_lockdownModeStatusLabel, "setAdjustsFontSizeToFitWidth:", 0);
    v6 = (void *)MEMORY[0x1E0DC1350];
    v7 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_lockdownModeStatusLabel, "setFont:", v9);

    -[SFLockdownStatusBar bounds](v3, "bounds");
    -[UILabel setFrame:](v3->_lockdownModeStatusLabel, "setFrame:");
    -[UILabel setAutoresizingMask:](v3->_lockdownModeStatusLabel, "setAutoresizingMask:", 18);
    -[UILabel setTextAlignment:](v3->_lockdownModeStatusLabel, "setTextAlignment:", 1);
    -[SFLockdownStatusBar _updateLockdownStatusLabel](v3, "_updateLockdownStatusLabel");
    -[SFLockdownStatusBar addSubview:](v3, "addSubview:", v3->_lockdownModeStatusLabel);
    v10 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_lockdownModeStatusLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)titleCapHeightInsetFromTop
{
  double result;

  -[UILabel _capOffsetFromBoundsTop](self->_lockdownModeStatusLabel, "_capOffsetFromBoundsTop");
  return result;
}

- (double)titleBaselineInsetFromBottom
{
  double result;

  -[UILabel _baselineOffsetFromBottom](self->_lockdownModeStatusLabel, "_baselineOffsetFromBottom");
  return result;
}

- (void)_updateLockdownStatusLabel
{
  -[SFLockdownStatusBar _updateLockdownStatusLabelAnimated:](self, "_updateLockdownStatusLabelAnimated:", 0);
}

- (void)_updateLockdownStatusLabelAnimated:(BOOL)a3
{
  int64_t v5;
  UILabel *lockdownModeStatusLabel;
  _QWORD v7[6];

  v5 = -[SFNavigationBarItem lockdownModeAnnotation](self->_navigationBarItem, "lockdownModeAnnotation");
  if (self->_currentLockdownStatus != v5)
  {
    if (a3)
    {
      lockdownModeStatusLabel = self->_lockdownModeStatusLabel;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__SFLockdownStatusBar__updateLockdownStatusLabelAnimated___block_invoke;
      v7[3] = &unk_1E21E2658;
      v7[4] = self;
      v7[5] = v5;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", lockdownModeStatusLabel, 5242880, v7, 0, 0.3);
    }
    else
    {
      -[SFLockdownStatusBar _updateLabelWithLockdownStatus:](self, "_updateLabelWithLockdownStatus:", v5);
    }
  }
}

uint64_t __58__SFLockdownStatusBar__updateLockdownStatusLabelAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLabelWithLockdownStatus:", *(_QWORD *)(a1 + 40));
}

- (void)_updateLabelWithLockdownStatus:(int64_t)a3
{
  void *v5;
  void *v6;

  WBSAnnotationStringForLockdownModeStatus();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_lockdownModeStatusLabel, "setText:", v5);

  if (a3 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_lockdownModeStatusLabel, "setTextColor:", v6);

  self->_currentLockdownStatus = a3;
}

- (void)setNavigationBarItem:(id)a3
{
  SFNavigationBarItem *v5;
  SFNavigationBarItem *navigationBarItem;
  SFNavigationBarItem *v7;

  v5 = (SFNavigationBarItem *)a3;
  navigationBarItem = self->_navigationBarItem;
  if (navigationBarItem != v5)
  {
    v7 = v5;
    -[SFNavigationBarItem removeObserver:](navigationBarItem, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    -[SFNavigationBarItem addObserver:](self->_navigationBarItem, "addObserver:", self);
    -[SFLockdownStatusBar _updateLockdownStatusLabelAnimated:](self, "_updateLockdownStatusLabelAnimated:", self->_shouldAnimateNavigationBarItemChanges);
    v5 = v7;
  }

}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_lockdownModeStatusLabel, "intrinsicContentSize");
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)preferredSquishedBottomSpacing
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  +[SFUnifiedBarMetrics defaultSquishedContentSpacing](SFUnifiedBarMetrics, "defaultSquishedContentSpacing");
  v4 = v3;
  -[SFLockdownStatusBar titleBaselineInsetFromBottom](self, "titleBaselineInsetFromBottom");
  v6 = v5;
  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  return v4 - v6 * v7;
}

- (BOOL)showsSquishedContent
{
  return 1;
}

- (double)preferredTopSpacing
{
  double v2;

  -[SFLockdownStatusBar titleCapHeightInsetFromTop](self, "titleCapHeightInsetFromTop");
  return 10.0 - v2;
}

- (double)preferredBottomSpacing
{
  double v2;

  -[SFLockdownStatusBar titleBaselineInsetFromBottom](self, "titleBaselineInsetFromBottom");
  return 10.0 - v2;
}

- (double)topSquishedSpacingAdjustment
{
  double v2;
  double v3;
  double v4;

  -[SFLockdownStatusBar titleCapHeightInsetFromTop](self, "titleCapHeightInsetFromTop");
  v3 = v2;
  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  return v3 * v4;
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (BOOL)shouldAnimateNavigationBarItemChanges
{
  return self->_shouldAnimateNavigationBarItemChanges;
}

- (void)setShouldAnimateNavigationBarItemChanges:(BOOL)a3
{
  self->_shouldAnimateNavigationBarItemChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_storeStrong((id *)&self->_lockdownModeStatusLabel, 0);
}

@end
