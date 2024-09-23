@implementation CSQuickActionControlGlyphView

- (CSQuickActionControlGlyphView)initWithControlInstance:(id)a3 symbolScaleValue:(double)a4
{
  id v7;
  CSQuickActionControlGlyphView *v8;
  CSQuickActionControlGlyphView *v9;
  uint64_t v10;
  CHUISControlIconView *iconView;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSQuickActionControlGlyphView;
  v8 = -[CSQuickActionControlGlyphView init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlInstance, a3);
    -[CHUISControlInstance iconView](v9->_controlInstance, "iconView");
    v10 = objc_claimAutoreleasedReturnValue();
    iconView = v9->_iconView;
    v9->_iconView = (CHUISControlIconView *)v10;

    -[CHUISControlIconView setOverrideUserInterfaceStyle:](v9->_iconView, "setOverrideUserInterfaceStyle:", 1);
    -[CSQuickActionControlGlyphView addSubview:](v9, "addSubview:", v9->_iconView);
    -[CSQuickActionControlGlyphView _updateAppearance](v9, "_updateAppearance");
    v9->_symbolScaleValue = a4;
  }

  return v9;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[CSQuickActionControlGlyphView _updateAppearance](self, "_updateAppearance");
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    -[CSQuickActionControlGlyphView _updateAppearance](self, "_updateAppearance");
  }
}

- (void)_updateAppearance
{
  int64_t appearance;
  double v3;

  appearance = self->_appearance;
  v3 = 1.0;
  if (appearance == 1)
    v3 = 0.5;
  if (appearance == 2)
    v3 = 0.25;
  -[CHUISControlIconView setAlpha:](self->_iconView, "setAlpha:", v3);
}

- (void)layoutSubviews
{
  CHUISControlIconView *iconView;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSQuickActionControlGlyphView;
  -[CSQuickActionControlGlyphView layoutSubviews](&v6, sel_layoutSubviews);
  iconView = self->_iconView;
  -[CSQuickActionControlGlyphView frame](self, "frame");
  -[CHUISControlIconView setFrame:](iconView, "setFrame:");
  -[CSQuickActionControlGlyphView bounds](self, "bounds");
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v4 * self->_symbolScaleValue, *MEMORY[0x1E0CEB5F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISControlIconView setFont:](self->_iconView, "setFont:", v5);

}

- (BOOL)isSelected
{
  return self->_selected;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_controlInstance, 0);
}

@end
