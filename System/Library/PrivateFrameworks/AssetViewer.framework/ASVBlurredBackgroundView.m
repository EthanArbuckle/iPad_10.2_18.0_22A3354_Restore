@implementation ASVBlurredBackgroundView

- (ASVBlurredBackgroundView)initWithFrame:(CGRect)a3 backgroundStyle:(int64_t)a4 controlStyle:(int64_t)a5
{
  ASVBlurredBackgroundView *v7;
  ASVBlurredBackgroundView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVBlurredBackgroundView;
  v7 = -[ASVBlurredBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_enabled = 1;
    v7->_selected = 0;
    v7->_highlighted = 0;
    v7->_backgroundStyle = a4;
    v7->_controlStyle = a5;
    -[ASVBlurredBackgroundView updateBackgroundEffects](v7, "updateBackgroundEffects");
  }
  return v8;
}

- (void)updateBackgroundEffects
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  _BOOL4 v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  if (-[ASVBlurredBackgroundView controlStyle](self, "controlStyle") == 2)
  {
    if (-[ASVBlurredBackgroundView isHighlighted](self, "isHighlighted")
      || -[ASVBlurredBackgroundView isSelected](self, "isSelected"))
    {
      objc_msgSend((id)objc_opt_class(), "selectedEffectsForARDarkStyle");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "normalEffectsForARDarkStyle");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  else if (-[ASVBlurredBackgroundView controlStyle](self, "controlStyle") == 3)
  {
    if (-[ASVBlurredBackgroundView isHighlighted](self, "isHighlighted")
      || -[ASVBlurredBackgroundView isSelected](self, "isSelected"))
    {
      objc_msgSend((id)objc_opt_class(), "selectedEffectsForDarkModeStyle");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "normalEffectsForDarkModeStyle");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (-[ASVBlurredBackgroundView isSelected](self, "isSelected")
      || -[ASVBlurredBackgroundView backgroundStyle](self, "backgroundStyle") == 1)
    {
      v4 = -[ASVBlurredBackgroundView isEnabled](self, "isEnabled");
      v5 = (void *)objc_opt_class();
      if (v4)
        objc_msgSend(v5, "selectedEffects");
      else
        objc_msgSend(v5, "disabledSelectedEffects");
    }
    else if (-[ASVBlurredBackgroundView isEnabled](self, "isEnabled"))
    {
      v6 = -[ASVBlurredBackgroundView isHighlighted](self, "isHighlighted");
      v7 = -[ASVBlurredBackgroundView controlStyle](self, "controlStyle");
      v8 = (void *)objc_opt_class();
      if (v6)
      {
        if (v7)
          objc_msgSend(v8, "highlightedEffectsForARStyle");
        else
          objc_msgSend(v8, "highlightedEffectsForStudioStyle");
      }
      else if (v7)
      {
        objc_msgSend(v8, "normalEffectsForARStyle");
      }
      else
      {
        objc_msgSend(v8, "normalEffectsForStudioStyle");
      }
    }
    else
    {
      v9 = -[ASVBlurredBackgroundView controlStyle](self, "controlStyle");
      v10 = (void *)objc_opt_class();
      if (v9)
        objc_msgSend(v10, "disabledEffectsForARStyle");
      else
        objc_msgSend(v10, "disabledEffectsForStudioStyle");
    }
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v3;
  -[ASVBlurredBackgroundView setBackgroundEffects:](self, "setBackgroundEffects:", v3);

}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

+ (id)normalEffectsForARStyle
{
  if (normalEffectsForARStyle_onceToken != -1)
    dispatch_once(&normalEffectsForARStyle_onceToken, &__block_literal_global_7);
  return (id)normalEffectsForARStyle_normalEffectsForARStyle;
}

+ (id)disabledEffectsForARStyle
{
  if (disabledEffectsForARStyle_onceToken != -1)
    dispatch_once(&disabledEffectsForARStyle_onceToken, &__block_literal_global_1);
  return (id)disabledEffectsForARStyle_disabledEffectsForARStyle;
}

void __53__ASVBlurredBackgroundView_disabledEffectsForARStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.375);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)disabledEffectsForARStyle_disabledEffectsForARStyle;
  disabledEffectsForARStyle_disabledEffectsForARStyle = v10;

}

+ (id)disabledEffectsForStudioStyle
{
  if (disabledEffectsForStudioStyle_onceToken != -1)
    dispatch_once(&disabledEffectsForStudioStyle_onceToken, &__block_literal_global_6);
  return (id)disabledEffectsForStudioStyle_disabledEffectsForStudioStyle;
}

void __57__ASVBlurredBackgroundView_disabledEffectsForStudioStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.425);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)disabledEffectsForStudioStyle_disabledEffectsForStudioStyle;
  disabledEffectsForStudioStyle_disabledEffectsForStudioStyle = v10;

}

void __51__ASVBlurredBackgroundView_normalEffectsForARStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.75);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)normalEffectsForARStyle_normalEffectsForARStyle;
  normalEffectsForARStyle_normalEffectsForARStyle = v10;

}

+ (id)normalEffectsForStudioStyle
{
  if (normalEffectsForStudioStyle_onceToken != -1)
    dispatch_once(&normalEffectsForStudioStyle_onceToken, &__block_literal_global_8);
  return (id)normalEffectsForStudioStyle_normalEffectsForStudioStyle;
}

void __55__ASVBlurredBackgroundView_normalEffectsForStudioStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.85);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)normalEffectsForStudioStyle_normalEffectsForStudioStyle;
  normalEffectsForStudioStyle_normalEffectsForStudioStyle = v10;

}

+ (id)highlightedEffectsForARStyle
{
  if (highlightedEffectsForARStyle_onceToken != -1)
    dispatch_once(&highlightedEffectsForARStyle_onceToken, &__block_literal_global_9);
  return (id)highlightedEffectsForARStyle_highlightedEffectsForARStyle;
}

void __56__ASVBlurredBackgroundView_highlightedEffectsForARStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)highlightedEffectsForARStyle_highlightedEffectsForARStyle;
  highlightedEffectsForARStyle_highlightedEffectsForARStyle = v10;

}

+ (id)highlightedEffectsForStudioStyle
{
  if (highlightedEffectsForStudioStyle_onceToken != -1)
    dispatch_once(&highlightedEffectsForStudioStyle_onceToken, &__block_literal_global_10);
  return (id)highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle;
}

void __60__ASVBlurredBackgroundView_highlightedEffectsForStudioStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.85);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 1010, 0.23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle;
  highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle = v10;

}

+ (id)disabledSelectedEffects
{
  if (disabledSelectedEffects_onceToken != -1)
    dispatch_once(&disabledSelectedEffects_onceToken, &__block_literal_global_11);
  return (id)disabledSelectedEffects_disabledSelectedEffects;
}

void __51__ASVBlurredBackgroundView_disabledSelectedEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)disabledSelectedEffects_disabledSelectedEffects;
  disabledSelectedEffects_disabledSelectedEffects = v3;

}

+ (id)selectedEffects
{
  if (selectedEffects_onceToken != -1)
    dispatch_once(&selectedEffects_onceToken, &__block_literal_global_12);
  return (id)selectedEffects_selectedEffects;
}

void __43__ASVBlurredBackgroundView_selectedEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)selectedEffects_selectedEffects;
  selectedEffects_selectedEffects = v3;

}

+ (id)normalEffectsForARDarkStyle
{
  if (normalEffectsForARDarkStyle_onceToken != -1)
    dispatch_once(&normalEffectsForARDarkStyle_onceToken, &__block_literal_global_13);
  return (id)normalEffectsForARDarkStyle_normalEffectsForARDarkStyle;
}

void __55__ASVBlurredBackgroundView_normalEffectsForARDarkStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v3, "effectWithBlurRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)normalEffectsForARDarkStyle_normalEffectsForARDarkStyle;
  normalEffectsForARDarkStyle_normalEffectsForARDarkStyle = v7;

}

+ (id)selectedEffectsForARDarkStyle
{
  if (selectedEffectsForARDarkStyle_onceToken != -1)
    dispatch_once(&selectedEffectsForARDarkStyle_onceToken, &__block_literal_global_14);
  return (id)selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle;
}

void __57__ASVBlurredBackgroundView_selectedEffectsForARDarkStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 24, 0.3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v3, "effectWithBlurRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle;
  selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle = v7;

}

+ (id)normalEffectsForDarkModeStyle
{
  if (normalEffectsForDarkModeStyle_onceToken != -1)
    dispatch_once(&normalEffectsForDarkModeStyle_onceToken, &__block_literal_global_15);
  return (id)normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle;
}

void __57__ASVBlurredBackgroundView_normalEffectsForDarkModeStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 0, 0.55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectCompositingColor:withMode:alpha:", v4, 0, 0.14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v6, "effectWithBlurRadius:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 1.8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle;
  normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle = v10;

}

+ (id)selectedEffectsForDarkModeStyle
{
  if (selectedEffectsForDarkModeStyle_onceToken != -1)
    dispatch_once(&selectedEffectsForDarkModeStyle_onceToken, &__block_literal_global_16);
  return (id)selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle;
}

void __59__ASVBlurredBackgroundView_selectedEffectsForDarkModeStyle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectCompositingColor:withMode:alpha:", v1, 23, 0.6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  objc_msgSend(v3, "effectWithBlurRadius:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle;
  selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle = v6;

}

- (void)setControlStyle:(int64_t)a3
{
  if (self->_controlStyle != a3)
  {
    self->_controlStyle = a3;
    -[ASVBlurredBackgroundView updateBackgroundEffects](self, "updateBackgroundEffects");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[ASVBlurredBackgroundView updateBackgroundEffects](self, "updateBackgroundEffects");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[ASVBlurredBackgroundView updateBackgroundEffects](self, "updateBackgroundEffects");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[ASVBlurredBackgroundView updateBackgroundEffects](self, "updateBackgroundEffects");
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

@end
