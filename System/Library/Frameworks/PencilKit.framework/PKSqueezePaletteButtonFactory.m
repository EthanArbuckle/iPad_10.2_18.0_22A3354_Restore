@implementation PKSqueezePaletteButtonFactory

- (PKSqueezePaletteButtonFactory)init
{
  PKSqueezePaletteButtonFactory *v2;
  uint64_t v3;
  UIFont *preferredFont;
  uint64_t v5;
  UIColor *preferredBaseBackgroundColor;
  uint64_t v7;
  UIColor *preferredBaseForegroundColor;
  uint64_t v9;
  UIColor *strokeWeightButtonForegroundColor;
  uint64_t v11;
  UIColor *strokeWeightButtonSelectedForegroundColor;
  uint64_t v13;
  UIColor *strokeWeightButtonBackgroundColor;
  uint64_t v15;
  UIColor *strokeWeightButtonSelectedBackgroundColor;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKSqueezePaletteButtonFactory;
  v2 = -[PKSqueezePaletteButtonFactory init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v3 = objc_claimAutoreleasedReturnValue();
    preferredFont = v2->_preferredFont;
    v2->_preferredFont = (UIFont *)v3;

    v2->_preferredImageScale = 2;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_47);
    v5 = objc_claimAutoreleasedReturnValue();
    preferredBaseBackgroundColor = v2->_preferredBaseBackgroundColor;
    v2->_preferredBaseBackgroundColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_2_0);
    v7 = objc_claimAutoreleasedReturnValue();
    preferredBaseForegroundColor = v2->_preferredBaseForegroundColor;
    v2->_preferredBaseForegroundColor = (UIColor *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_3);
    v9 = objc_claimAutoreleasedReturnValue();
    strokeWeightButtonForegroundColor = v2->_strokeWeightButtonForegroundColor;
    v2->_strokeWeightButtonForegroundColor = (UIColor *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_4_0);
    v11 = objc_claimAutoreleasedReturnValue();
    strokeWeightButtonSelectedForegroundColor = v2->_strokeWeightButtonSelectedForegroundColor;
    v2->_strokeWeightButtonSelectedForegroundColor = (UIColor *)v11;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_5_0);
    v13 = objc_claimAutoreleasedReturnValue();
    strokeWeightButtonBackgroundColor = v2->_strokeWeightButtonBackgroundColor;
    v2->_strokeWeightButtonBackgroundColor = (UIColor *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_6);
    v15 = objc_claimAutoreleasedReturnValue();
    strokeWeightButtonSelectedBackgroundColor = v2->_strokeWeightButtonSelectedBackgroundColor;
    v2->_strokeWeightButtonSelectedBackgroundColor = (UIColor *)v15;

  }
  return v2;
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonBaseBackgroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_2(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonBaseForegroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_3(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonForegroundColor(a2);
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_4(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonSelectedForegroundColor(a2);
}

uint64_t __37__PKSqueezePaletteButtonFactory_init__block_invoke_5()
{
  return PKSqueezePaletteStrokeWeightButtonBackgroundColor();
}

id __37__PKSqueezePaletteButtonFactory_init__block_invoke_6(uint64_t a1, void *a2)
{
  return PKSqueezePaletteStrokeWeightButtonSelectedBackgroundColor(a2);
}

- (id)sliderButtonConfigurationIsLTR:(uint64_t)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    -[PKSqueezePaletteButtonFactory undoButtonConfigurationIsLTR:](a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBaseBackgroundColor:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)undoButtonConfigurationIsLTR:(uint64_t)a1
{
  __CFString *v2;

  if (a2)
    v2 = CFSTR("arrow.uturn.left");
  else
    v2 = CFSTR("arrow.uturn.right");
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __64__PKSqueezePaletteButtonFactory_sliderButtonConfigurationIsLTR___block_invoke(uint64_t a1, void *a2)
{
  return PKSqueezePaletteButtonExpandedLayoutBaseBackgroundColor(a2);
}

- (id)_preferredButtonConfigurationWithSystemImageName:(uint64_t)a1
{
  if (a1)
  {
    -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:baseBackgroundColor:]((_QWORD *)a1, a2, *(void **)(a1 + 24));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (PKSqueezePaletteRoundedButton)makeUndoButtonIsLTR:(uint64_t)a1
{
  PKSqueezePaletteRoundedButton *v4;
  void *v5;

  if (a1)
  {
    v4 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    -[PKSqueezePaletteButtonFactory undoButtonConfigurationIsLTR:](a1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSqueezePaletteRoundedButton setConfiguration:](v4, "setConfiguration:", v5);

    -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Undo-Button"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PKSqueezePaletteRoundedButton)makeRedoButtonIsLTR:(uint64_t)a1
{
  PKSqueezePaletteRoundedButton *v4;
  __CFString *v5;
  void *v6;

  if (a1)
  {
    v4 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    if (a2)
      v5 = CFSTR("arrow.uturn.right");
    else
      v5 = CFSTR("arrow.uturn.left");
    -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSqueezePaletteRoundedButton setConfiguration:](v4, "setConfiguration:", v6);

    -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Redo-Button"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)makeDrawingToolButtonWithTool:(uint64_t)a1
{
  id v2;
  id v3;

  if (a1)
  {
    v2 = a2;
    v3 = -[PKSqueezePaletteDrawingTool initWithTool:]([PKSqueezePaletteDrawingTool alloc], v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)makeMulticolorButtonWithColor:(uint64_t)a1
{
  id v2;
  id *v3;

  if (a1)
  {
    v2 = a2;
    v3 = -[PKSqueezePaletteMulticolorSwatchButton initWithColor:]((id *)[PKSqueezePaletteMulticolorSwatchButton alloc], v2);

    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("MultiColor-Swatch"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)makeColorSwatchButtonWithColor:(uint64_t)a1
{
  id v2;
  id *v3;

  if (a1)
  {
    v2 = a2;
    v3 = -[PKSqueezePaletteColorSwatchButton initWithColor:]((id *)[PKSqueezePaletteColorSwatchButton alloc], v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (PKSqueezePaletteRoundedButton)makeMoreButton
{
  PKSqueezePaletteRoundedButton *v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(PKSqueezePaletteRoundedButton);
    -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:](a1, CFSTR("ellipsis"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSqueezePaletteRoundedButton setConfiguration:](v2, "setConfiguration:", v3);

    -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("More-Button"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)makeBackButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:baseBackgroundColor:](self, CFSTR("arrow.left"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v5);

  -[PKSqueezePaletteRoundedButton setPointerStyleProvider:](v3, "setPointerStyleProvider:", &__block_literal_global_28);
  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Back-Button"));
  return v3;
}

- (id)_preferredButtonConfigurationWithSystemImageName:(void *)a3 baseBackgroundColor:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = (void *)MEMORY[0x1E0DC3520];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "filledButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", a1[1], a1[2]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setImage:", v10);
    objc_msgSend(v8, "setBaseBackgroundColor:", v6);

    objc_msgSend(v8, "setBaseForegroundColor:", a1[4]);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id __47__PKSqueezePaletteButtonFactory_makeBackButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0DC3D90];
  v6 = a4;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithView:", v7);

  objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)makeTextBoxButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, CFSTR("character.textbox"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v4);

  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Add Text"));
  return v3;
}

- (id)makeSignatureButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, CFSTR("signature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v4);

  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Add Signature"));
  return v3;
}

- (id)makeShapesButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, CFSTR("square.on.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v4);

  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Add Shape"));
  return v3;
}

- (id)makeStickersButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, CFSTR("sticker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v4);

  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Add Sticker"));
  return v3;
}

- (id)makeGearButton
{
  PKSqueezePaletteRoundedButton *v3;
  void *v4;

  v3 = objc_alloc_init(PKSqueezePaletteRoundedButton);
  -[PKSqueezePaletteButtonFactory _preferredButtonConfigurationWithSystemImageName:]((uint64_t)self, CFSTR("gearshape"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteRoundedButton setConfiguration:](v3, "setConfiguration:", v4);

  -[PKSqueezePaletteRoundedButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Settings-Button"));
  return v3;
}

- (PKSqueezePaletteObjectEraserButton)makeObjectEraserButton
{
  PKSqueezePaletteObjectEraserButton *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  if (!a1)
    return (PKSqueezePaletteObjectEraserButton *)0;
  v2 = objc_alloc_init(PKSqueezePaletteObjectEraserButton);
  objc_initWeak(&location, a1);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__PKSqueezePaletteButtonFactory_makeObjectEraserButton__block_invoke;
  v11 = &unk_1E777AC20;
  objc_copyWeak(&v12, &location);
  -[PKSqueezePaletteObjectEraserButton setConfigurationUpdateHandler:](v2, "setConfigurationUpdateHandler:", &v8);
  objc_msgSend(MEMORY[0x1E0DC3520], "tintedButtonConfiguration", v8, v9, v10, v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  -[PKSqueezePaletteObjectEraserButton setConfiguration:](v2, "setConfiguration:", v3);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v2;
}

void __55__PKSqueezePaletteButtonFactory_makeObjectEraserButton__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained(v2);
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSelected");
  v6 = 56;
  if (v5)
    v6 = 64;
  objc_msgSend(v4, "setBaseBackgroundColor:", *(_QWORD *)&WeakRetained[v6]);
  v7 = objc_msgSend(v3, "isSelected");
  v8 = 40;
  if (v7)
    v8 = 48;
  objc_msgSend(v4, "setBaseForegroundColor:", *(_QWORD *)&WeakRetained[v8]);
  objc_msgSend(v3, "setConfiguration:", v4);

}

- (double)makeStrokeWeightButtonForTool:(double)a3 withWeight:
{
  id v5;
  double *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v5 = a2;
  if (a1)
  {
    v6 = -[PKSqueezePaletteStrokeWeightButton initWithStrokeWeight:]([PKSqueezePaletteStrokeWeightButton alloc], a3);
    objc_initWeak(&location, a1);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __74__PKSqueezePaletteButtonFactory_makeStrokeWeightButtonForTool_withWeight___block_invoke;
    v18 = &unk_1E777AC20;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v6, "setConfigurationUpdateHandler:", &v15);
    objc_msgSend(MEMORY[0x1E0DC3520], "tintedButtonConfiguration", v15, v16, v17, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "strokeWeightsToButtonImages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:renderingMode:", v12, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v13);

    objc_msgSend(v6, "setConfiguration:", v7);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __74__PKSqueezePaletteButtonFactory_makeStrokeWeightButtonForTool_withWeight___block_invoke(uint64_t a1, void *a2)
{
  char *WeakRetained;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v9, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "isSelected");
    v6 = 56;
    if (v5)
      v6 = 64;
    objc_msgSend(v4, "setBaseBackgroundColor:", *(_QWORD *)&WeakRetained[v6]);
    v7 = objc_msgSend(v9, "isSelected");
    v8 = 40;
    if (v7)
      v8 = 48;
    objc_msgSend(v4, "setBaseForegroundColor:", *(_QWORD *)&WeakRetained[v8]);
    objc_msgSend(v9, "setConfiguration:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeWeightButtonSelectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonSelectedForegroundColor, 0);
  objc_storeStrong((id *)&self->_strokeWeightButtonForegroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBaseForegroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBaseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredFont, 0);
}

@end
