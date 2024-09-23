@implementation MKPlaceSectionItemView

- (MKPlaceSectionItemView)initWithFrame:(CGRect)a3
{
  MKPlaceSectionItemView *v3;
  MKPlaceSectionItemView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceSectionItemView;
  v3 = -[MKViewWithHairline initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView mk_theme](v3, "mk_theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "separatorLineColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKViewWithHairline setHairlineColor:](v4, "setHairlineColor:", v6);

    -[MKViewWithHairline setTopHairlineHidden:](v4, "setTopHairlineHidden:", 1);
    -[MKViewWithHairline setBottomHairlineHidden:](v4, "setBottomHairlineHidden:", 1);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[MKPlaceSectionItemView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlaceSectionItemView;
  -[UIView infoCardThemeChanged](&v5, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorLineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline setHairlineColor:](self, "setHairlineColor:", v4);

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  -[MKPlaceSectionItemView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[MKPlaceSectionItemView infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionItemView;
  -[MKPlaceSectionItemView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MKPlaceSectionItemView _updateHairlineInsets](self, "_updateHairlineInsets");
}

- (void)_updateHairlineInsets
{
  int IsRightToLeft;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!self->_fullWidthHairline)
  {
    IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
    -[MKPlaceSectionItemView layoutMargins](self, "layoutMargins");
    if (IsRightToLeft)
      v6 = v5;
    else
      v6 = v4;
    if (IsRightToLeft)
      v7 = v4;
    else
      v7 = v5;
    -[MKViewWithHairline setLeftHairlineInset:](self, "setLeftHairlineInset:", v6);
    -[MKViewWithHairline setRightHairlineInset:](self, "setRightHairlineInset:", v7);
  }
}

- (void)setFullWidthHairline:(BOOL)a3
{
  self->_fullWidthHairline = a3;
  if (a3)
  {
    -[MKViewWithHairline setLeftHairlineInset:](self, "setLeftHairlineInset:", 0.0);
    -[MKViewWithHairline setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  }
  else
  {
    -[MKPlaceSectionItemView _updateHairlineInsets](self, "_updateHairlineInsets");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceSectionItemView;
  -[MKPlaceSectionItemView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MKPlaceSectionItemView _updateHairlineInsets](self, "_updateHairlineInsets");
  -[MKPlaceSectionItemView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MKPlaceSectionItemView infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (BOOL)isHairlineFullWidth
{
  return self->_fullWidthHairline;
}

@end
