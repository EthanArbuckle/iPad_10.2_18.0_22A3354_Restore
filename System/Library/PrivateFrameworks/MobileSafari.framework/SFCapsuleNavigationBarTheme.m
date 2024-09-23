@implementation SFCapsuleNavigationBarTheme

- (id)backgroundOverlayEffects
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void **v7;
  id result;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  switch(-[_SFBarTheme tintStyle](self, "tintStyle"))
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0DC3F50];
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0.8;
      if (self->_hidesOverlayEffects)
        v5 = 0.0;
      objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v6;
      v7 = (void **)v19;
      goto LABEL_15;
    case 2:
      v9 = (void *)MEMORY[0x1E0DC3F50];
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0.12;
      if (self->_hidesOverlayEffects)
        v10 = 0.0;
      objc_msgSend(v9, "effectCompositingColor:withMode:alpha:", v4, 24, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v6;
      v7 = &v18;
      goto LABEL_15;
    case 3:
      v11 = (void *)MEMORY[0x1E0DC3F50];
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0.68;
      if (self->_hidesOverlayEffects)
        v12 = 0.0;
      objc_msgSend(v11, "effectCompositingColor:withMode:alpha:", v4, 23, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v7 = &v17;
      goto LABEL_15;
    case 4:
      v13 = (void *)MEMORY[0x1E0DC3F50];
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0.3;
      if (self->_hidesOverlayEffects)
        v14 = 0.0;
      objc_msgSend(v13, "effectCompositingColor:withMode:alpha:", v4, 23, v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6;
      v7 = &v16;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      result = v15;
      break;
    default:
      result = MEMORY[0x1E0C9AA60];
      break;
  }
  return result;
}

- (void)setBackgroundTheme:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTheme, a3);
}

+ (BOOL)backdropIsDarkForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 3)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SFCapsuleNavigationBarTheme;
  return objc_msgSendSuper2(&v6, sel_backdropIsDarkForStyle_);
}

+ (id)backdropEffectForStyle:(int64_t)a3
{
  void *v3;
  objc_super v5;

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___SFCapsuleNavigationBarTheme;
    objc_msgSendSuper2(&v5, sel_backdropEffectForStyle_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setHidesOverlayEffects:(BOOL)a3
{
  self->_hidesOverlayEffects = a3;
}

- (BOOL)isEqual:(id)a3
{
  SFCapsuleNavigationBarTheme *v4;
  unsigned __int8 *v5;
  BOOL v6;
  objc_super v8;

  v4 = (SFCapsuleNavigationBarTheme *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFCapsuleNavigationBarTheme;
    if (-[_SFBarTheme isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (WBSIsEqual())
        v6 = self->_hidesOverlayEffects == v5[80];
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (_SFBarTheme)contentTheme
{
  SFCapsuleNavigationBarTheme *backgroundTheme;

  backgroundTheme = (SFCapsuleNavigationBarTheme *)self->_backgroundTheme;
  if (!backgroundTheme || !self->_hidesOverlayEffects)
    backgroundTheme = self;
  return (_SFBarTheme *)backgroundTheme;
}

- (_SFBarTheme)backgroundTheme
{
  return self->_backgroundTheme;
}

- (void)applyBackdropEffectsToView:(id)a3
{
  id v4;
  _SFBarTheme *backgroundTheme;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  backgroundTheme = self->_backgroundTheme;
  if (backgroundTheme)
  {
    -[_SFBarTheme applyBackdropEffectsToView:](backgroundTheme, "applyBackdropEffectsToView:", v4);
    -[SFCapsuleNavigationBarTheme backgroundOverlayEffects](self, "backgroundOverlayEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v4, "backgroundEffects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundEffects:", v8);

LABEL_6:
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)SFCapsuleNavigationBarTheme;
  -[_SFBarTheme applyBackdropEffectsToView:](&v9, sel_applyBackdropEffectsToView_, v4);
  if (-[_SFBarTheme tintStyle](self, "tintStyle") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);
    goto LABEL_6;
  }
LABEL_8:

}

- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme
{
  return (SFUnifiedTabBarItemTitleContainerViewTheme *)-[SFCapsuleNavigationBarTheme _titleThemeIsMinimized:](self, "_titleThemeIsMinimized:", 0);
}

- (id)_titleThemeIsMinimized:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SFUnifiedTabBarItemTitleContainerViewTheme *v12;
  void *v13;
  SFUnifiedTabBarItemTitleContainerViewTheme *v14;

  v3 = a3;
  v5 = _SFIsPrivateTintStyle(-[_SFBarTheme tintStyle](self, "tintStyle"));
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && !v3)
  {
    objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & v3 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[_SFBarTheme controlsTintColor](self, "controlsTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = [SFUnifiedTabBarItemTitleContainerViewTheme alloc];
  -[_SFBarTheme preferredBarTintColor](self, "preferredBarTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SFUnifiedTabBarItemTitleContainerViewTheme initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:overrideTintColor:themeColor:](v12, "initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:overrideTintColor:themeColor:", v8, v10, v10, v11, v13);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTheme, 0);
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme
{
  return (SFUnifiedTabBarItemTitleContainerViewTheme *)-[SFCapsuleNavigationBarTheme _titleThemeIsMinimized:](self, "_titleThemeIsMinimized:", 1);
}

- (BOOL)hidesOverlayEffects
{
  return self->_hidesOverlayEffects;
}

@end
