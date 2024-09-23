@implementation PKSqueezePaletteColorSwatchButton

- (id)initWithColor:(id *)a1
{
  id *v4;
  PKPaletteColorSwatch *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v26 = a2;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)PKSqueezePaletteColorSwatchButton;
    v4 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 95, a2);
      v5 = objc_alloc_init(PKPaletteColorSwatch);
      v6 = a1[94];
      a1[94] = v5;

      objc_msgSend(a1[94], "setSwatchColor:", a1[95]);
      objc_msgSend(a1[94], "setUserInteractionEnabled:", 0);
      objc_msgSend(a1[94], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1, "addSubview:", a1[94]);
      v21 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(a1[94], "centerXAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v23;
      objc_msgSend(a1[94], "centerYAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerYAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v8;
      objc_msgSend(a1[94], "widthAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v11;
      objc_msgSend(a1[94], "heightAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v15);

      objc_initWeak(&location, a1);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __51__PKSqueezePaletteColorSwatchButton_initWithColor___block_invoke;
      v27[3] = &unk_1E777A1C0;
      objc_copyWeak(&v28, &location);
      objc_msgSend(a1, "setPointerStyleProvider:", v27);
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v26, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("MiniPalette-ColorSwatch-%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setAccessibilityIdentifier:", v18);

      objc_msgSend(v26, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setAccessibilityLabel:", v19);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

id __51__PKSqueezePaletteColorSwatchButton_initWithColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *v8;
  void *WeakRetained;
  id v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a2;
  v7 = a4;
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained(v8);
    v11 = objc_msgSend(v10, "isSelected");

    if ((v11 & 1) != 0)
    {
      WeakRetained = 0;
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v6);
      objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, v7);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return WeakRetained;
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteColorSwatchButton;
  -[PKSqueezePaletteColorSwatchButton setSelected:](&v4, sel_setSelected_, a3);
  -[PKPaletteColorSwatch setSelected:](self->_swatch, "setSelected:", -[PKSqueezePaletteColorSwatchButton isSelected](self, "isSelected"));
}

- (void)setHighlighted:(BOOL)a3
{
  int v4;
  PKPaletteColorSwatch *swatch;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSqueezePaletteColorSwatchButton;
  -[PKSqueezePaletteColorSwatchButton setHighlighted:](&v6, sel_setHighlighted_, a3);
  v4 = -[PKSqueezePaletteColorSwatchButton isHighlighted](self, "isHighlighted");
  swatch = self->_swatch;
  if (swatch)
  {
    if (swatch->_showsSelectionHighlight != v4)
    {
      swatch->_showsSelectionHighlight = v4;
      -[PKPaletteColorSwatch _updateSelectionHighlight](swatch);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_swatch, 0);
}

@end
