@implementation PKPaletteDictationBarButton

- (PKPaletteDictationBarButton)initWithBarButtonItem:(id)a3
{
  PKPaletteDictationBarButton *v3;
  PKPaletteDictationBarButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteDictationBarButton;
  v3 = -[PKPaletteBarButton initWithBarButtonItem:](&v6, sel_initWithBarButtonItem_, a3);
  v4 = v3;
  if (v3)
    -[PKPaletteDictationBarButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Scribble-Dictation-Button"));
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteDictationBarButton;
  -[PKPaletteDictationBarButton willMoveToWindow:](&v11, sel_willMoveToWindow_, v4);
  if (v4)
  {
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "hasActiveKeyboardResponder");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9 != 0;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v6, "hasNullInputView") ^ 1;
    else
      v10 = 1;
    -[PKPaletteButton setEnabled:](self, "setEnabled:", v7 & v10);
    if (qword_1ECEE6158 != -1)
      dispatch_once(&qword_1ECEE6158, &__block_literal_global_22);
    -[PKPaletteButton setSelected:](self, "setSelected:", objc_msgSend(objc_retainAutorelease((id)_MergedGlobals_119), "isRunning"));

  }
}

- (id)_tintColorForCurrentState
{
  void *v3;
  objc_super v5;

  if ((-[PKPaletteDictationBarButton isSelected](self, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteDictationBarButton;
    -[PKPaletteButton _tintColorForCurrentState](&v5, sel__tintColorForCurrentState);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_backgroundColor
{
  void *v3;
  objc_super v5;

  if (-[PKPaletteButton useCompactLayout](self, "useCompactLayout")
    || (-[PKPaletteDictationBarButton isSelected](self, "isSelected") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteDictationBarButton;
    -[PKPaletteButton _backgroundColor](&v5, sel__backgroundColor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
