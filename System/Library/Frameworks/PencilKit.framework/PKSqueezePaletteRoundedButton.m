@implementation PKSqueezePaletteRoundedButton

- (PKSqueezePaletteRoundedButton)init
{
  PKSqueezePaletteRoundedButton *v2;
  PKSqueezePaletteRoundedButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteRoundedButton;
  v2 = -[PKSqueezePaletteRoundedButton initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[PKSqueezePaletteRoundedButton setPointerInteractionEnabled:](v2, "setPointerInteractionEnabled:", 1);
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKSqueezePaletteRoundedButton;
  -[PKSqueezePaletteRoundedButton layoutSubviews](&v21, sel_layoutSubviews);
  -[PKSqueezePaletteRoundedButton bounds](self, "bounds");
  v4 = v3;
  -[PKSqueezePaletteRoundedButton bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[PKSqueezePaletteRoundedButton layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  -[PKSqueezePaletteRoundedButton layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

  -[PKSqueezePaletteRoundedButton layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsEdgeAntialiasing:", 1);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKSqueezePaletteRoundedButton layer](self, "layer", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sublayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "setAllowsEdgeAntialiasing:", 1);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v14);
  }

}

@end
