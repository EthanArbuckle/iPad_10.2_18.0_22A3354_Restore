@implementation MKHairlineView

- (MKHairlineView)initWithFrame:(CGRect)a3
{
  MKHairlineView *v3;
  id v4;
  uint64_t v5;
  UIView *contentView;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)MKHairlineView;
  v3 = -[MKHairlineView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    -[MKHairlineView _invalidateStyleProvider](v3, "_invalidateStyleProvider");
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[MKHairlineView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v8, sel__invalidateStyleProvider);

  }
  return v3;
}

- (id)_bestStyleProviderForTraitCollection:(id)a3
{
  uint64_t v3;
  __objc2_class **v4;

  v3 = objc_msgSend(a3, "_vibrancy");
  v4 = off_1E20D5188;
  if (v3 != 1)
    v4 = off_1E20D50A8;
  return objc_alloc_init(*v4);
}

- (void)_invalidateStyleProvider
{
  void *v3;
  MKHairlineViewStyleProvider *v4;
  MKHairlineViewStyleProvider *styleProvider;

  -[MKHairlineView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKHairlineView _bestStyleProviderForTraitCollection:](self, "_bestStyleProviderForTraitCollection:", v3);
  v4 = (MKHairlineViewStyleProvider *)objc_claimAutoreleasedReturnValue();
  styleProvider = self->_styleProvider;
  self->_styleProvider = v4;

  -[MKHairlineView _updateAppearanceForVibrancyChange](self, "_updateAppearanceForVibrancyChange");
}

- (void)_updateAppearanceForVibrancyChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  MKHairlineViewStyleProvider *styleProvider;
  void *v7;
  void *v8;
  void *v9;
  MKHairlineView *v10;

  -[MKHairlineView fillColor](self, "fillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

  -[MKHairlineView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_vibrancy");

  if (v5 == 1)
  {
    -[MKHairlineView _createVibrancyEffectViewIfNeeded](self, "_createVibrancyEffectViewIfNeeded");
    -[UIVisualEffectView setHidden:](self->_vibrancyEffectView, "setHidden:", 0);
    styleProvider = self->_styleProvider;
    -[MKHairlineView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHairlineViewStyleProvider vibrancyEffectForTraitCollection:](styleProvider, "vibrancyEffectForTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_vibrancyEffectView, "setEffect:", v8);

    -[MKHairlineView _fetchVibrancyGroupNameIfNeeded](self, "_fetchVibrancyGroupNameIfNeeded");
    -[UIVisualEffectView contentView](self->_vibrancyEffectView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_contentView);

    -[UIVisualEffectView superview](self->_vibrancyEffectView, "superview");
    v10 = (MKHairlineView *)objc_claimAutoreleasedReturnValue();

    if (v10 != self)
    {
      -[MKHairlineView addSubview:](self, "addSubview:", self->_vibrancyEffectView);
      -[MKHairlineView _updateViewPositioning](self, "_updateViewPositioning");
    }
  }
  else
  {
    -[MKHairlineView addSubview:](self, "addSubview:", self->_contentView);
    -[MKHairlineView _updateViewPositioning](self, "_updateViewPositioning");
    -[UIVisualEffectView setHidden:](self->_vibrancyEffectView, "setHidden:", 1);
  }
}

- (void)_createVibrancyEffectViewIfNeeded
{
  UIVisualEffectView *v3;
  UIVisualEffectView *vibrancyEffectView;

  if (!self->_vibrancyEffectView)
  {
    v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    vibrancyEffectView = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v3;

  }
}

- (void)_fetchVibrancyGroupNameIfNeeded
{
  void *v3;
  UIVisualEffectView *vibrancyEffectView;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[MKHairlineView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    vibrancyEffectView = self->_vibrancyEffectView;
    if (vibrancyEffectView)
    {
      if ((-[UIVisualEffectView isHidden](vibrancyEffectView, "isHidden") & 1) == 0)
      {
        -[UIVisualEffectView _groupName](self->_vibrancyEffectView, "_groupName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");

        if (!v6)
        {
          -[MKHairlineView window](self, "window");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            -[MKHairlineView superview](self, "superview");
            v8 = objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              while (1)
              {
                v11 = (id)v8;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  break;
                objc_msgSend(v11, "superview");
                v9 = objc_claimAutoreleasedReturnValue();

                v8 = v9;
                if (!v9)
                  return;
              }
              objc_msgSend(v11, "vibrancyGroupName");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIVisualEffectView _setGroupName:](self->_vibrancyEffectView, "_setGroupName:", v10);

            }
          }
        }
      }
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKHairlineView;
  -[MKHairlineView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKHairlineView _updateViewPositioning](self, "_updateViewPositioning");
}

- (void)_updateViewPositioning
{
  id v3;

  -[MKHairlineView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_vibrancyEffectView, "setFrame:");
  -[UIView superview](self->_contentView, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKHairlineView;
  -[MKHairlineView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MKHairlineView _fetchVibrancyGroupNameIfNeeded](self, "_fetchVibrancyGroupNameIfNeeded");
}

- (void)setFillColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[MKHairlineView fillColor](self, "fillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v5);

  }
}

- (UIColor)fillColor
{
  UIColor *fillColor;

  fillColor = self->_fillColor;
  if (fillColor)
    return fillColor;
  -[MKHairlineViewStyleProvider fillColor](self->_styleProvider, "fillColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
