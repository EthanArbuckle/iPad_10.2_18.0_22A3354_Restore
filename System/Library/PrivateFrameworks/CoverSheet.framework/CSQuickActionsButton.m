@implementation CSQuickActionsButton

- (CSQuickActionsButton)initWithAction:(id)a3 luminanceMap:(id)a4
{
  id v6;
  CSQuickActionsButton *v7;
  CSQuickActionsButton *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSQuickActionsButton;
  v7 = -[CSProminentButtonControl initWithFrame:luminanceMap:](&v10, sel_initWithFrame_luminanceMap_, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
    -[CSQuickActionsButton setAction:](v7, "setAction:", v6);

  return v8;
}

- (void)setAppearance:(int64_t)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    -[CSProminentButtonControl glyphView](self, "glyphView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CSProminentButtonControl glyphView](self, "glyphView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAppearance:", self->_appearance);

    }
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSQuickActionsButton _updateTintColorForPermittedState](self, "_updateTintColorForPermittedState");
  }

}

- (void)setAction:(id)a3
{
  CSQuickAction *v5;

  v5 = (CSQuickAction *)a3;
  if (self->_action != v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_storeStrong((id *)&self->_action, a3);
    -[CSQuickAction setDelegate:](v5, "setDelegate:", self);
    -[CSQuickActionsButton setHidden:](self, "setHidden:", -[CSQuickAction showsButton](v5, "showsButton") ^ 1);
    -[CSQuickActionsButton setAppearance:](self, "setAppearance:", -[CSQuickAction appearance](v5, "appearance"));
    -[CSQuickActionsButton setEnabled:](self, "setEnabled:", -[CSQuickAction allowsInteraction](v5, "allowsInteraction"));
    -[CSProminentButtonControl setSelected:](self, "setSelected:", -[CSQuickAction isSelected](v5, "isSelected"));
    -[CSQuickActionsButton _updateTintColorForPermittedState](self, "_updateTintColorForPermittedState");
    -[CSQuickActionsButton _actionVisibilityDidUpdate](self, "_actionVisibilityDidUpdate");
  }

}

- (void)setGlyphView:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[CSProminentButtonControl glyphView](self, "glyphView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)CSQuickActionsButton;
    -[CSProminentButtonControl setGlyphView:](&v6, sel_setGlyphView_, v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setAppearance:", self->_appearance);
  }

}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[CSQuickActionsButton _actionVisibilityDidUpdate](self, "_actionVisibilityDidUpdate");
  }
}

- (void)_actionVisibilityDidUpdate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[CSQuickActionsButton action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CSQuickActionsButton action](self, "action");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_visible)
    {
      -[CSQuickActionsButton action](self, "action");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "showsButton"))
        v6 = 2;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v8, "controlInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisibility:", v6);

  }
}

- (void)showsButtonDidChangeForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CSQuickActionsButton action](self, "action");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 == v6)
  {
    -[CSQuickActionsButton setHidden:](self, "setHidden:", objc_msgSend(v6, "showsButton") ^ 1);
    -[CSQuickActionsButton setAppearance:](self, "setAppearance:", objc_msgSend(v6, "appearance"));
    -[CSQuickActionsButton setEnabled:](self, "setEnabled:", objc_msgSend(v6, "allowsInteraction"));
    -[CSQuickActionsButton _actionVisibilityDidUpdate](self, "_actionVisibilityDidUpdate");
    v5 = v6;
  }

}

- (void)isSelectedDidChangeForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CSQuickActionsButton action](self, "action");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 == v6)
  {
    -[CSProminentButtonControl setSelected:](self, "setSelected:", objc_msgSend(v6, "isSelected"));
    v5 = v6;
  }

}

- (void)allowsInteractionDidChangeForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CSQuickActionsButton action](self, "action");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 == v6)
  {
    -[CSQuickActionsButton setAppearance:](self, "setAppearance:", objc_msgSend(v6, "appearance"));
    -[CSQuickActionsButton setEnabled:](self, "setEnabled:", objc_msgSend(v6, "allowsInteraction"));
    v5 = v6;
  }

}

- (void)_updateTintColorForPermittedState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int64_t appearance;
  double v8;
  id v9;

  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  appearance = self->_appearance;
  v8 = 1.0;
  if (appearance == 1)
    v8 = 0.5;
  if (appearance == 2)
    v8 = 0.25;
  objc_msgSend(v6, "colorWithAlphaComponent:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CSQuickActionsButton setTintColor:](self, "setTintColor:", v9);
}

- (id)_accessoryTitleForAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "accessoryTitleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_systemImageWithName:(id)a3 configuration:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_imageThatSuppressesAccessibilityHairlineThickening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (self->_callingSuper
    || (objc_msgSend((id)-[CSQuickActionsButton superclass](self, "superclass"), "instancesRespondToSelector:", sel_clickInteractionShouldBegin_) & 1) == 0)
  {
    self->_callingSuper = 0;
    goto LABEL_6;
  }
  self->_callingSuper = 1;
  v9.receiver = self;
  v9.super_class = (Class)CSQuickActionsButton;
  v5 = -[CSQuickActionsButton performSelector:withObject:](&v9, sel_performSelector_withObject_, sel_clickInteractionShouldBegin_, v4);
  self->_callingSuper = 0;
  if (v5)
  {
LABEL_6:
    -[CSQuickActionsButton delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "shouldAllowClickInteraction:toBeginForButton:", v4, self);

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (BOOL)visible
{
  return self->_visible;
}

- (CSQuickAction)action
{
  return self->_action;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CSQuickActionsButtonDelegate)delegate
{
  return (CSQuickActionsButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
