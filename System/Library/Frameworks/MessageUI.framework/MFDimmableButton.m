@implementation MFDimmableButton

- (unint64_t)state
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFDimmableButton;
  v3 = -[MFDimmableButton state](&v5, sel_state);
  if (-[MFDimmableButton isDimmed](self, "isDimmed"))
    return v3 | 0x10000;
  else
    return v3;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
  -[MFDimmableButton _updateDimmedHidingIfNecessary](self, "_updateDimmedHidingIfNecessary");
  -[MFDimmableButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHidden:(BOOL)a3
{
  -[MFDimmableButton _setHidden:external:](self, "_setHidden:external:", a3, 1);
}

- (void)_setHidden:(BOOL)a3 external:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  if (!a4
    || (-[MFDimmableButton setStickyHiddenValue:](self, "setStickyHiddenValue:", a3),
        -[MFDimmableButton autohidePreference](self, "autohidePreference") != 1))
  {
    v6.receiver = self;
    v6.super_class = (Class)MFDimmableButton;
    -[MFDimmableButton setHidden:](&v6, sel_setHidden_, v4);
  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFDimmableButton;
  -[MFDimmableButton setSelected:](&v4, sel_setSelected_, a3);
  -[MFDimmableButton _updateDimmedHidingIfNecessary](self, "_updateDimmedHidingIfNecessary");
}

- (void)setHidesWhenDimmedIfNotSelected:(BOOL)a3
{
  self->_hidesWhenDimmedIfNotSelected = a3;
  -[MFDimmableButton _updateDimmedHidingIfNecessary](self, "_updateDimmedHidingIfNecessary");
}

- (void)_updateDimmedHidingIfNecessary
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[MFDimmableButton autohidePreference](self, "autohidePreference");
  if (v3 == 1)
  {
    v4 = 1;
  }
  else
  {
    if (v3 != 2)
      return;
    v4 = 0;
  }
  -[MFDimmableButton _setHidden:external:](self, "_setHidden:external:", v4, 0);
}

- (unint64_t)autohidePreference
{
  if (!-[MFDimmableButton hidesWhenDimmedIfNotSelected](self, "hidesWhenDimmedIfNotSelected"))
    return 0;
  if (-[MFDimmableButton isDimmed](self, "isDimmed")
    && !-[MFDimmableButton isSelected](self, "isSelected"))
  {
    return 1;
  }
  return 2;
}

- (BOOL)hidesWhenDimmedIfNotSelected
{
  return self->_hidesWhenDimmedIfNotSelected;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)stickyHiddenValue
{
  return self->_stickyHiddenValue;
}

- (void)setStickyHiddenValue:(BOOL)a3
{
  self->_stickyHiddenValue = a3;
}

@end
