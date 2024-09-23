@implementation PKSqueezePaletteMulticolorSwatchButton

- (id)initWithColor:(id *)a1
{
  id v4;
  id *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
    v5 = (id *)objc_msgSendSuper2(&v24, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 95, a2);
      v6 = -[PKPaletteColorSwatch initWithSelectionRingInset:bulletInset:]([PKPaletteMulticolorSwatch alloc], 4.0, 7.0);
      v7 = a1[94];
      a1[94] = v6;

      objc_msgSend(a1[94], "setUserInteractionEnabled:", 0);
      objc_msgSend(a1[94], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1, "addSubview:", a1[94]);
      v18 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(a1[94], "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v21;
      objc_msgSend(a1[94], "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v8;
      objc_msgSend(a1[94], "widthAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v11;
      objc_msgSend(a1[94], "heightAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v15);

      -[PKSqueezePaletteMulticolorSwatchButton _updateSwatchColor]((uint64_t)a1);
      -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)a1);
      objc_msgSend(a1[94], "accessibilityIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setAccessibilityIdentifier:", v16);

    }
  }

  return a1;
}

- (void)_updateSwatchColor
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 760);
    if (v2)
    {
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v2, CFSTR("multi"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 752), "setSwatchColor:", v3);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 752), "setSwatchColor:", 0);
    }
  }
}

- (void)_updateUI
{
  int v2;
  _BYTE *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 752), "setSelected:", *(_QWORD *)(a1 + 760) != 0);
    v2 = objc_msgSend((id)a1, "isHighlighted");
    v3 = *(_BYTE **)(a1 + 752);
    if (v3)
    {
      if (v3[417] != v2)
      {
        v3[417] = v2;
        -[PKPaletteColorSwatch _updateSelectionHighlight](v3);
        v3 = *(_BYTE **)(a1 + 752);
      }
    }
    -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v3, *(_QWORD *)(a1 + 768));
  }
}

- (void)setColor:(uint64_t)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && *(id *)(a1 + 760) != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(a1 + 760), a2);
    -[PKSqueezePaletteMulticolorSwatchButton _updateSwatchColor](a1);
    -[PKSqueezePaletteMulticolorSwatchButton _updateUI](a1);
    v4 = v5;
  }

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
  -[PKSqueezePaletteMulticolorSwatchButton setSelected:](&v4, sel_setSelected_, a3);
  -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)self);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteMulticolorSwatchButton;
  -[PKSqueezePaletteMulticolorSwatchButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[PKSqueezePaletteMulticolorSwatchButton _updateUI]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_swatch, 0);
}

@end
